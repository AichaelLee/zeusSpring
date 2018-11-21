package com.lzz.common.util;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.ClientConfiguration;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.*;
import com.amazonaws.services.s3.transfer.TransferManager;
import com.amazonaws.services.s3.transfer.TransferManagerConfiguration;
import com.amazonaws.services.s3.transfer.Upload;
import com.lzz.common.constant.Constant;
import com.lzz.common.exception.S3FileException;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import java.net.URL;
import java.util.*;

/**
 * Amazon S3へファイルの格納
 *
 * @author
 *
 */
public class AmazonS3Util {

    public static final String SEPARATOR = "/";
    // ルートディレクトリ
    public static final String ROOT_PATH = "root" + SEPARATOR;
    // attachfileパス
    public static final String ATTACHFILE_PATH = ROOT_PATH + "attachfile" + SEPARATOR;
    // reportパス
    public static final String REPORT_PATH = ROOT_PATH + "report" + SEPARATOR;
    // contractパス
    public static final String CONTRACT_PATH = ROOT_PATH + "contract" + SEPARATOR;
    // contract/distributeパス
    public static final String CONTRACT_DISTRIBUTE_PATH = ROOT_PATH + "contract" + SEPARATOR + "distribute";

    private static Logger logger = LoggerFactory.getLogger(AmazonS3Util.class);

    // インスタンス変数へ格上げ
    private static String accessKey=PropertiesUtil.getProperty("BUCKETEER_AWS_ACCESS_KEY_ID");
    private static String accessSecretKey=PropertiesUtil.getProperty("BUCKETEER_AWS_SECRET_ACCESS_KEY");
    private static String bucketName=PropertiesUtil.getProperty("BUCKETEER_BUCKET_NAME");
//
//    @Value("${spring.BUCKETEER_AWS_ACCESS_KEY_ID}")
//    public void setAccessKey(String key) {
//        accessKey = key;
//    }
//    @Value("${spring.BUCKETEER_AWS_SECRET_ACCESS_KEY}")
//    public void setAccessSecretKey(String key){ accessSecretKey = key;}
//    @Value("${spring.BUCKETEER_BUCKET_NAME}")
//    public void setBucketName(String key){bucketName = key;}

    // S3エンドポイント（cloudServerのIP或いはドメイン名）
    //    private static final String ENDPOINT = "https://bucketeer-888f5df6-79b1-428b-b294-27bf80784371.s3.amazonaws.com/";
    private static final String ENDPOINT = "https://" + bucketName + ".s3.amazonaws.com/";
    // マルチパートアップロード最少サイズ
    private static final long PART_SIZE = 5 * 1024L * 1024L;

    private static Integer connectionTimeout = 30000;

    /**
     * 概要：ファイルをS３にuploadするの実装方法(URL返さない)
     *
     * @param s3FolderName ｓ３にuploadしたいfoloderのpath
     * @param tarS3FileName S3でのファイル名
     * @param is INPUT
     * @param size ファイルサイズ
     * @param contentType アップロードするファイルのcontentType
     */
    public static void putByFile(String s3FolderName, String tarS3FileName, InputStream is, long size,
            String contentType) {

        String opName = "AmazonS3Util.putByFile";
        StringBuilder logPrefixSb = new StringBuilder();
        logPrefixSb.append(Constant.OPERATION_LOG_ID);
        logPrefixSb.append(" ");
        logPrefixSb.append(Constant.OPERATION_ID);
        logPrefixSb.append("=");
        logPrefixSb.append(opName);

        String logPrefix = logPrefixSb.toString();
        logger.info(Constant.OPERATION_START + " " + logPrefix + " " + Constant.OPERATION_PARAMS + "="
                + "[{" + "s3FolderName=" + s3FolderName + ", " + "tarS3FileName=" + tarS3FileName + ", "
                + "size=" + size + ", " + "contentType=" + contentType + "}]");
        long start = System.currentTimeMillis();

        try {
            // create a client connection based on credentials
            AWSCredentials credentials = new BasicAWSCredentials(accessKey, accessSecretKey);
            AmazonS3 s3client = new AmazonS3Client(credentials);

            // create bucket - name must be unique for all S3 users
            s3client.createBucket(bucketName);

            // create folder into bucket
            createFolder(s3FolderName, s3client);

            // upload file to folder and set it to public
            String s3FilePath = s3FolderName + SEPARATOR + tarS3FileName;
            ObjectMetadata objectMetadata = new ObjectMetadata();
            objectMetadata.setContentLength(size);
            objectMetadata.setContentType(contentType);
            s3client.putObject(new PutObjectRequest(bucketName, s3FilePath, is, objectMetadata)
                    .withCannedAcl(CannedAccessControlList.PublicRead));
        } catch (Exception e) {
            throw e;
        } finally {
            IOUtils.closeQuietly(is);
        }

        logger.info(Constant.OPERATION_END + " " + logPrefix + " " + Constant.OPERATION_DURATION + "="
                + (System.currentTimeMillis() - start) + "ms" + " " + Constant.OPERATION_PARAMS + "="
                + "[{" + "s3FolderName=" + s3FolderName + ", " + "tarS3FileName=" + tarS3FileName + ", "
                + "size=" + size + ", " + "contentType=" + contentType + "}]");
    }

    /**
     * 概要：ファイルをS３にuploadするの実装方法(URL返さない)
     *
     * @param s3FolderName ｓ３にuploadしたいfoloderのpath
     * @param tarS3FileName ｓ３にuploadしたいfileのname
     * @param file
     */
    public static void putByFile(String s3FolderName, String tarS3FileName, File file) {
        String opName = "AmazonS3Util.putByFile";
        StringBuilder logPrefixSb = new StringBuilder();
        logPrefixSb.append(Constant.OPERATION_LOG_ID);
        logPrefixSb.append(" ");
        logPrefixSb.append(Constant.OPERATION_ID);
        logPrefixSb.append("=");
        logPrefixSb.append(opName);

        String logPrefix = logPrefixSb.toString();
        logger.info(Constant.OPERATION_START + " " + logPrefix + " " + Constant.OPERATION_PARAMS + "="
                + "[{" + "s3FolderName=" + s3FolderName + ", " + "tarS3FileName=" + tarS3FileName + "}]");
        long start = System.currentTimeMillis();

        ObjectMetadata metadata = new ObjectMetadata();
        metadata.setContentLength(0);

        // create a client connection based on credentials
        AWSCredentials credentials = new BasicAWSCredentials(accessKey, accessSecretKey);
        AmazonS3 s3client = new AmazonS3Client(credentials);

        // create bucket - name must be unique for all S3 users
        s3client.createBucket(bucketName);

        // create folder into bucket
        createFolder(s3FolderName, s3client);

        // upload file to folder and set it to public
        String s3FilePath = s3FolderName + SEPARATOR + tarS3FileName;
        s3client.putObject(new PutObjectRequest(bucketName, s3FilePath, file)
                .withCannedAcl(CannedAccessControlList.PublicRead));

        logger.info(Constant.OPERATION_END + " " + logPrefix + " " + Constant.OPERATION_DURATION + "="
                + (System.currentTimeMillis() - start) + "ms" + " " + Constant.OPERATION_PARAMS + "="
                + "[{" + "s3FolderName=" + s3FolderName + ", " + "tarS3FileName=" + tarS3FileName + "}]");
    }

    /**
     * 概要：ファイルをS３にuploadするの実装方法(URL返さない)
     *
     * @param s3FolderName ｓ３にuploadしたいfoloderのpath
     * @param tarS3FileName ｓ３にuploadしたいfileのname
     * @param localFloderPath uploadしたいfileのpath（local上）
     * @param localFileName uploadしたいfileのname（local上）
     */
    public static void putByFilePath(String s3FolderName, String tarS3FileName, String localFloderPath,
            String localFileName) {

        String opName = "AmazonS3Util.putByFilePath";
        StringBuilder logPrefixSb = new StringBuilder();
        logPrefixSb.append(Constant.OPERATION_LOG_ID);
        logPrefixSb.append(" ");
        logPrefixSb.append(Constant.OPERATION_ID);
        logPrefixSb.append("=");
        logPrefixSb.append(opName);

        String logPrefix = logPrefixSb.toString();
        logger.info(Constant.OPERATION_START + " " + logPrefix + " " + Constant.OPERATION_PARAMS + "="
                + "[{" + "s3FolderName=" + s3FolderName + ", " + "tarS3FileName=" + tarS3FileName + ", "
                + "localFloderPath=" + localFloderPath + ", " + "localFileName=" + localFileName + "}]");
        long start = System.currentTimeMillis();

        ObjectMetadata metadata = new ObjectMetadata();
        metadata.setContentLength(0);

        // create a client connection based on credentials
        AWSCredentials credentials = new BasicAWSCredentials(accessKey, accessSecretKey);
        AmazonS3 s3client = new AmazonS3Client(credentials);

        // create bucket - name must be unique for all S3 users
        s3client.createBucket(bucketName);

        // create folder into bucket
        createFolder(s3FolderName, s3client);

        // upload file to folder and set it to public
        String s3FilePath = s3FolderName + SEPARATOR + tarS3FileName;
        String useLocalFilePath = localFloderPath + SEPARATOR + localFileName;
        s3client.putObject(new PutObjectRequest(bucketName, s3FilePath, new File(useLocalFilePath))
                .withCannedAcl(CannedAccessControlList.PublicRead));

        logger.info(Constant.OPERATION_END + " " + logPrefix + " " + Constant.OPERATION_DURATION + "="
                + (System.currentTimeMillis() - start) + "ms" + " " + Constant.OPERATION_PARAMS + "="
                + "[{" + "s3FolderName=" + s3FolderName + ", " + "tarS3FileName=" + tarS3FileName + ", "
                + "localFloderPath=" + localFloderPath + ", " + "localFileName=" + localFileName + "}]");
    }

    /**
     * 概要：一時領域に存在するファイルを全てamzonS3にアップロード
     *
     * @param s3Path amazonS3のパス
     * @param tabId タブID 一時領域に配置したファイルを取得するために使用する
     * @param sessionId セッションID
     *
     * @throws Exception
     * @deprecated
     */
    public static void putFileInTempDir(String s3Path, String tabId, String sessionId) throws Exception {

        String opName = "AmazonS3Util.putFileInTempDir";
        StringBuilder logPrefixSb = new StringBuilder();
        logPrefixSb.append(Constant.OPERATION_LOG_ID);
        logPrefixSb.append(" ");
        logPrefixSb.append(Constant.OPERATION_ID);
        logPrefixSb.append("=");
        logPrefixSb.append(opName);

        String logPrefix = logPrefixSb.toString();
        logger.info(Constant.OPERATION_START + " " + logPrefix + " " + Constant.OPERATION_PARAMS + "="
                + "[{" + "s3Path=" + s3Path + ", " + "tabId=" + tabId + ", "
                + "sessionId=" + sessionId + "}]");
        long start = System.currentTimeMillis();

        // 一時領域に存在するファイルを取得
        String tempDirPath = FileUtil.getTempDirPath(sessionId, tabId);
        File tempDir = new File(tempDirPath);
        Collection<File> fileList = FileUtils.listFiles(tempDir, null, false);
        for (File file : fileList) {
            putByFilePath(s3Path, file.getName(), tempDirPath, file.getName());
        }
        // Tempフォルダを消す
        FileUtils.cleanDirectory(tempDir);

        logger.info(Constant.OPERATION_END + " " + logPrefix + " " + Constant.OPERATION_DURATION + "="
                + (System.currentTimeMillis() - start) + "ms" + " " + Constant.OPERATION_PARAMS + "="
                + "[{" + "s3Path=" + s3Path + ", " + "tabId=" + tabId + ", "
                + "sessionId=" + sessionId + "}]");

    }

    /**
     * 概要：一時領域に存在するファイルをamzonS3にアップロード
     *
     * @param s3Path amazonS3のパス
     * @param s3FileName amazonS3でのファイル名（特定の名前でアップロードしたい場合に設定）
     * @param localFileName アップロードしたファイル名
     * @param tabId タブID 一時領域に配置したファイルを取得するために使用する
     * @param sessionId セッションID
     *
     * @throws S3FileException
     */
    public static void putFileInTempDir(String s3Path, String s3FileName, String localFileName, String tabId,
            String sessionId) throws S3FileException {

        String opName = "AmazonS3Util.putFileInTempDir";
        StringBuilder logPrefixSb = new StringBuilder();
        logPrefixSb.append(Constant.OPERATION_LOG_ID);
        logPrefixSb.append(" ");
        logPrefixSb.append(Constant.OPERATION_ID);
        logPrefixSb.append("=");
        logPrefixSb.append(opName);

        String logPrefix = logPrefixSb.toString();
        logger.info(Constant.OPERATION_START + " " + logPrefix + " " + Constant.OPERATION_PARAMS + "="
                + "[{" + "s3Path=" + s3Path + ", " + "s3FileName=" + s3FileName + ", "
                + "localFileName=" + localFileName + ", " + "tabId=" + tabId + ", "
                + "sessionId=" + sessionId + "}]");
        long start = System.currentTimeMillis();

        try {
            // 一時領域のパス
            String tempDirPath = FileUtil.getTempDirPath(sessionId, tabId);

            // amzonS3にアップロード
            putByFilePath(s3Path,
                    Optional.ofNullable(s3FileName).orElse(localFileName),
                    tempDirPath,
                    localFileName);

            // Tempファイルを削除
            FileUtil.deleteTempDir(sessionId, tabId, localFileName);
        } catch (Exception e) {
            throw new S3FileException("MFW01E043", e);
        }

        logger.info(Constant.OPERATION_END + " " + logPrefix + " " + Constant.OPERATION_DURATION + "="
                + (System.currentTimeMillis() - start) + "ms" + " " + Constant.OPERATION_PARAMS + "="
                + "[{" + "s3Path=" + s3Path + ", " + "s3FileName=" + s3FileName + ", "
                + "localFileName=" + localFileName + ", " + "tabId=" + tabId + ", "
                + "sessionId=" + sessionId + "}]");
    }

    /**
     * 概要：ファイルをS３にuploadするの実装方法(URL返す)
     *
     * @param s3FolderName ｓ３にuploadしたいfoloderのpath
     * @param tarFileName ｓ３にuploadしたいfileのname
     * @param localFloderPath uploadしたいfileのpath（local上）
     * @param localFileName uploadしたいfileのname（local上）
     * @param expirationDate urlのlinit時間を設定
     *
     * @return URL
     */
    public static URL putByFilePathReturnUrl(String s3FolderName, String tarFileName, String localFloderPath,
            String localFileName, Date expirationDate) {

        String opName = "AmazonS3Util.putByFilePathReturnUrl";
        StringBuilder logPrefixSb = new StringBuilder();
        logPrefixSb.append(Constant.OPERATION_LOG_ID);
        logPrefixSb.append(" ");
        logPrefixSb.append(Constant.OPERATION_ID);
        logPrefixSb.append("=");
        logPrefixSb.append(opName);

        String logPrefix = logPrefixSb.toString();
        logger.info(Constant.OPERATION_START + " " + logPrefix + " " + Constant.OPERATION_PARAMS + "="
                + "[{" + "s3FolderName=" + s3FolderName + ", " + "tarFileName=" + tarFileName + ", "
                + "localFloderPath=" + localFloderPath + ", " + "localFileName=" + localFileName + ", "
                + "expirationDate=" + expirationDate.toString() + "}]");
        long start = System.currentTimeMillis();

        URL url = null;

        ObjectMetadata metadata = new ObjectMetadata();
        metadata.setContentLength(0);

        AWSCredentials credentials = new BasicAWSCredentials(accessKey, accessSecretKey);
        AmazonS3 s3client = new AmazonS3Client(credentials);

        s3client.createBucket(bucketName);

        createFolder(s3FolderName, s3client);

        String allFloderName = s3FolderName + SEPARATOR + tarFileName;
        String useLocalFilePath = localFloderPath + SEPARATOR + localFileName;
        s3client.putObject(new PutObjectRequest(bucketName, allFloderName, new File(useLocalFilePath))
                .withCannedAcl(CannedAccessControlList.PublicRead));

        //requestを取得
        GeneratePresignedUrlRequest urlRequest = new GeneratePresignedUrlRequest(
                bucketName, allFloderName);

        //linit時間を設定
        urlRequest.setExpiration(expirationDate);
        //download urlを生成
        url = s3client.generatePresignedUrl(urlRequest);

        logger.info(Constant.OPERATION_END + " " + logPrefix + " " + Constant.OPERATION_DURATION + "="
                + (System.currentTimeMillis() - start) + "ms" + " " + Constant.OPERATION_PARAMS + "="
                + "[{" + "s3FolderName=" + s3FolderName + ", " + "tarFileName=" + tarFileName + ", "
                + "localFloderPath=" + localFloderPath + ", " + "localFileName=" + localFileName + ", "
                + "expirationDate=" + expirationDate.toString() + "}]");

        return url;
    }

    /**
     * 概要：ファイルをS３にuploadするの実装方法
     *
     * @param s3FilePath ｓ３にuploadされたファイルのpath
     * @param contentLength メタデータに分割したデータのサイズを指定
     * @param inputStream Stream化したのファイル
     *
     * @throws S3FileException
     * @throws InterruptedException
     * @throws AmazonClientException
     * @throws AmazonServiceException
     */
    public static void putObjectFile(String s3FilePath, long contentLength, InputStream inputStream)
            throws S3FileException, AmazonServiceException, AmazonClientException, InterruptedException {

        String opName = "AmazonS3Util.putObjectFile";
        StringBuilder logPrefixSb = new StringBuilder();
        logPrefixSb.append(Constant.OPERATION_LOG_ID);
        logPrefixSb.append(" ");
        logPrefixSb.append(Constant.OPERATION_ID);
        logPrefixSb.append("=");
        logPrefixSb.append(opName);

        String logPrefix = logPrefixSb.toString();
        logger.info(Constant.OPERATION_START + " " + logPrefix + " " + Constant.OPERATION_PARAMS + "="
                + "[{" + "s3FilePath=" + s3FilePath + ", " + "contentLength=" + contentLength + "}]");
        long start = System.currentTimeMillis();

        // AmazonS3Clientインスタンスを作成
        AmazonS3Client client = makeS3Client();

        // Endpointの生成
        client.setEndpoint(ENDPOINT);

        // TransferManagerを利用
        TransferManager manager = new TransferManager(client);

        // 分割サイズを設定
        TransferManagerConfiguration c = new TransferManagerConfiguration();
        c.setMinimumUploadPartSize(PART_SIZE);
        manager.setConfiguration(c);

        // メタデータに分割したデータのサイズを指定
        ObjectMetadata putMetaData = new ObjectMetadata();
        putMetaData.setContentLength(contentLength);

        Upload upload = manager.upload(bucketName, s3FilePath, inputStream, putMetaData);

        upload.waitForCompletion();

        logger.info(Constant.OPERATION_END + " " + logPrefix + " " + Constant.OPERATION_DURATION + "="
                + (System.currentTimeMillis() - start) + "ms" + " " + Constant.OPERATION_PARAMS + "="
                + "[{" + "s3FilePath=" + s3FilePath + ", " + "contentLength=" + contentLength + "}]");
    }

    /**
     * 概要：ファイルを移動（ｓ３上のファイルに限り）
     *
     * @param oldS3FilePath ｓ３上移動前のファイルpath
     * @param newS3FloderPath ｓ３上移動先のfolderPath
     * @param fileName ｓ３上移動先にrenameしたfileName
     */
    public static void moveFileToNewFloder(String oldS3FilePath, String newS3FloderPath, String fileName) {

        String opName = "AmazonS3Util.moveFileToNewFloder";
        StringBuilder logPrefixSb = new StringBuilder();
        logPrefixSb.append(Constant.OPERATION_LOG_ID);
        logPrefixSb.append(" ");
        logPrefixSb.append(Constant.OPERATION_ID);
        logPrefixSb.append("=");
        logPrefixSb.append(opName);

        String logPrefix = logPrefixSb.toString();
        logger.info(Constant.OPERATION_START + " " + logPrefix + " " + Constant.OPERATION_PARAMS + "="
                + "[{" + "oldS3FilePath=" + oldS3FilePath + ", " + "newS3FloderPath=" + newS3FloderPath + ", "
                + "fileName=" + fileName + "}]");
        long start = System.currentTimeMillis();

        // AmazonS3Clientインスタンスを作成
        AmazonS3Client client = makeS3Client();

        if (!getS3FloderExistFlag(newS3FloderPath)) {
            createFolder(newS3FloderPath, client);
        }
        CopyObjectRequest copyObjRequest = new CopyObjectRequest(
                bucketName, oldS3FilePath, bucketName, newS3FloderPath + SEPARATOR + fileName);

        client.copyObject(copyObjRequest);

        deleteFolder(oldS3FilePath, client);

        logger.info(Constant.OPERATION_END + " " + logPrefix + " " + Constant.OPERATION_DURATION + "="
                + (System.currentTimeMillis() - start) + "ms" + " " + Constant.OPERATION_PARAMS + "="
                + "[{" + "oldS3FilePath=" + oldS3FilePath + ", " + "newS3FloderPath=" + newS3FloderPath + ", "
                + "fileName=" + fileName + "}]");

    }

    /**
     * 概要：floder及び中のファイルを移動（ｓ３上）
     *
     * @param oldS3FloderPath ｓ３上移動したいのfolderPath
     * @param newS3FloderPath ｓ３上移動先のfolderPath
     */
    public static void moveFloderToNewFloder(String oldS3FloderPath, String newS3FloderPath) {

        String opName = "AmazonS3Util.moveFloderToNewFloder";
        StringBuilder logPrefixSb = new StringBuilder();
        logPrefixSb.append(Constant.OPERATION_LOG_ID);
        logPrefixSb.append(" ");
        logPrefixSb.append(Constant.OPERATION_ID);
        logPrefixSb.append("=");
        logPrefixSb.append(opName);

        String logPrefix = logPrefixSb.toString();
        logger.info(Constant.OPERATION_START + " " + logPrefix + " " + Constant.OPERATION_PARAMS + "="
                + "[{" + "oldS3FloderPath=" + oldS3FloderPath + ", " + "newS3FloderPath=" + newS3FloderPath + "}]");
        long start = System.currentTimeMillis();

        // AmazonS3Clientインスタンスを作成
        AmazonS3Client client = makeS3Client();

        Map<String, String> floderFiles = getAllFilesInThisPath(oldS3FloderPath);
        if (floderFiles != null) {
            Set<String> keys = floderFiles.keySet();
            if (keys != null) {
                if (!getS3FloderExistFlag(newS3FloderPath)) {
                    createFolder(newS3FloderPath, client);
                }
                Iterator<String> keyIt = keys.iterator();
                while (keyIt.hasNext()) {
                    String thisFileName = keyIt.next().toString();
                    String oldS3FilePath = floderFiles.get(thisFileName);
                    String newS3FilePath = oldS3FilePath.replaceAll(oldS3FloderPath, newS3FloderPath);

                    CopyObjectRequest copyObjRequest = new CopyObjectRequest(
                            bucketName, oldS3FilePath, bucketName, newS3FilePath);

                    client.copyObject(copyObjRequest);
                }

                deleteFolder(oldS3FloderPath, client);
            }

        }

        logger.info(Constant.OPERATION_END + " " + logPrefix + " " + Constant.OPERATION_DURATION + "="
                + (System.currentTimeMillis() - start) + "ms" + " " + Constant.OPERATION_PARAMS + "="
                + "[{" + "oldS3FloderPath=" + oldS3FloderPath + ", " + "newS3FloderPath=" + newS3FloderPath + "}]");

    }

    /**
     * 概要：当s3pathの下全ファイルを取り出す (本物のファイルではなく、ｓ３側のpathです)
     *
     * @param tarS3Path 取り出したいfolderのpath
     * @return allFilesInThisPath ｓ３側のpathをファイル名をmapにして取り出す
     */
    public static Map<String, String> getAllFilesInThisPath(String tarS3Path) {

        String opName = "AmazonS3Util.getAllFilesInThisPath";
        StringBuilder logPrefixSb = new StringBuilder();
        logPrefixSb.append(Constant.OPERATION_LOG_ID);
        logPrefixSb.append(" ");
        logPrefixSb.append(Constant.OPERATION_ID);
        logPrefixSb.append("=");
        logPrefixSb.append(opName);

        String logPrefix = logPrefixSb.toString();
        logger.info(Constant.OPERATION_START + " " + logPrefix + " " + Constant.OPERATION_PARAMS + "="
                + "[{" + "tarS3Path=" + tarS3Path + "}]");
        long start = System.currentTimeMillis();

        Map<String, String> allFilesInThisPath = null;

        List<String> allPath = listAll(bucketName);
        if (allPath != null) {
            allFilesInThisPath = new HashMap<String, String>();
            for (int i = 0; i < allPath.size(); i++) {
                String[] tempPath = allPath.get(i).split(tarS3Path + SEPARATOR);
                if (tempPath.length > 1) {
                    String fleName = tempPath[1].split(SEPARATOR)[tempPath[1].split(SEPARATOR).length - 1];
                    allFilesInThisPath.put(fleName, allPath.get(i));

                }
            }
        }

        logger.info(Constant.OPERATION_END + " " + logPrefix + " " + Constant.OPERATION_DURATION + "="
                + (System.currentTimeMillis() - start) + "ms" + " " + Constant.OPERATION_PARAMS + "="
                + "[{" + "tarS3Path=" + tarS3Path + "}]");

        return allFilesInThisPath;
    }

    /**
     * 概要：ファイル及びフォルダーの削除機能
     *
     * @param tarFolderName 削除先のpath
     *
     * @throws S3FileException
     */
    public static void deleteFilePath(String tarFolderName) throws S3FileException {

        String opName = "AmazonS3Util.deleteFilePath";
        StringBuilder logPrefixSb = new StringBuilder();
        logPrefixSb.append(Constant.OPERATION_LOG_ID);
        logPrefixSb.append(" ");
        logPrefixSb.append(Constant.OPERATION_ID);
        logPrefixSb.append("=");
        logPrefixSb.append(opName);

        String logPrefix = logPrefixSb.toString();
        logger.info(Constant.OPERATION_START + " " + logPrefix + " " + Constant.OPERATION_PARAMS + "="
                + "[{" + "tarFolderName=" + tarFolderName + "}]");
        long start = System.currentTimeMillis();

        try {
            // create a client connection based on credentials
            AWSCredentials credentials = new BasicAWSCredentials(accessKey, accessSecretKey);
            AmazonS3 s3client = new AmazonS3Client(credentials);

            // create bucket - name must be unique for all S3 users
            s3client.createBucket(bucketName);

            deleteFolder(tarFolderName, s3client);
        } catch (Exception e) {
            throw new S3FileException("MFW01E043", e);
        }

        logger.info(Constant.OPERATION_END + " " + logPrefix + " " + Constant.OPERATION_DURATION + "="
                + (System.currentTimeMillis() - start) + "ms" + " " + Constant.OPERATION_PARAMS + "="
                + "[{" + "tarFolderName=" + tarFolderName + "}]");
    }

    /**
     * 概要：オブジェクト取得
     *
     * @param objectKey
     * @return S3ObjectInputStream
     */
    public static S3ObjectInputStream getObjectFile(String objectKey) {
        return getS3ObjectFile(objectKey).getObjectContent();
    }

    /**
     * 概要：S3オブジェクト取得
     *
     * @param objectKey
     * @return S3ObjectInputStream
     */
    public static S3Object getS3ObjectFile(String objectKey) {

        String opName = "AmazonS3Util.deleteFilePath";
        StringBuilder logPrefixSb = new StringBuilder();
        logPrefixSb.append(Constant.OPERATION_LOG_ID);
        logPrefixSb.append(" ");
        logPrefixSb.append(Constant.OPERATION_ID);
        logPrefixSb.append("=");
        logPrefixSb.append(opName);

        String logPrefix = logPrefixSb.toString();
        logger.info(Constant.OPERATION_START + " " + logPrefix + " " + Constant.OPERATION_PARAMS + "="
                + "[{" + "objectKey=" + objectKey + "}]");
        long start = System.currentTimeMillis();

        // AmazonS3Clientインスタンスを作成
        AmazonS3Client client = makeS3Client();

        // エンドポイントを設定
        client.setEndpoint(ENDPOINT);

        // rootDirectory(Bucket名), objectKey(オブジェクトまでの相対パス)からリクエストを作成
        GetObjectRequest request = new GetObjectRequest("", objectKey);

        S3Object object = client.getObject(request);

        logger.info(Constant.OPERATION_END + " " + logPrefix + " " + Constant.OPERATION_DURATION + "="
                + (System.currentTimeMillis() - start) + "ms" + " " + Constant.OPERATION_PARAMS + "="
                + "[{" + "objectKey=" + objectKey + "}]");

        // Objectを返す
        return object;
    }

    /**
     * 概要 : 指定したフォルダ配下のファイルを取得（１件目のみ）
     *
     * @param dirPath AmazonS3のパス
     * @return S3Object
     * @throws Exception
     * @deprecated
     */
    public static S3Object getFileOnlyOne(String dirPath)
            throws Exception {

        String opName = "AmazonS3Util.getFileOnlyOne";
        StringBuilder logPrefixSb = new StringBuilder();
        logPrefixSb.append(Constant.OPERATION_LOG_ID);
        logPrefixSb.append(" ");
        logPrefixSb.append(Constant.OPERATION_ID);
        logPrefixSb.append("=");
        logPrefixSb.append(opName);

        String logPrefix = logPrefixSb.toString();
        logger.info(Constant.OPERATION_START + " " + logPrefix + " " + Constant.OPERATION_PARAMS + "="
                + "[{" + "dirPath=" + dirPath + "}]");
        long start = System.currentTimeMillis();

        // AmazonS3Clientインスタンスを作成
        AmazonS3Client client = makeS3Client();

        String prefix = dirPath;
        ListObjectsRequest loRequest = new ListObjectsRequest()
                .withBucketName(bucketName)
                .withPrefix(prefix)
                .withDelimiter("/");
        ObjectListing list = client.listObjects(loRequest);
        List<S3ObjectSummary> dirList = list.getObjectSummaries();

        S3ObjectSummary targetS3Obj = null;
        Iterator<S3ObjectSummary> itr = dirList.iterator();
        while (itr.hasNext()) {
            targetS3Obj = itr.next();
            if (!StringUtils.equals(prefix, targetS3Obj.getKey())) {
                break;
            }
        }

        if (targetS3Obj == null) {
            return null;
        }
        // rootDirectory(Bucket名), objectKey(オブジェクトまでの相対パス)からリクエストを作成
        GetObjectRequest goRequest = new GetObjectRequest(targetS3Obj.getBucketName(), targetS3Obj.getKey());
        S3Object object = client.getObject(goRequest);

        logger.info(Constant.OPERATION_END + " " + logPrefix + " " + Constant.OPERATION_DURATION + "="
                + (System.currentTimeMillis() - start) + "ms" + " " + Constant.OPERATION_PARAMS + "="
                + "[{" + "dirPath=" + dirPath + "}]");

        // S3Objectを返す
        return object;
    }

    /**
     * 概要：ｓ３側のFolderを作成
     *
     * @param folderName 削除先のpath
     * @param client S3に接続
     */
    public static void createFolder(String folderName, AmazonS3 client) {
        // create meta-data for your folder and set content-length to 0
        ObjectMetadata metadata = new ObjectMetadata();
        metadata.setContentLength(0);
        // create empty content
        InputStream emptyContent = new ByteArrayInputStream(new byte[0]);
        // create a PutObjectRequest passing the folder name suffixed by /
        PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName,
                folderName + SEPARATOR, emptyContent, metadata);
        // send request to S3 to create folder
        client.putObject(putObjectRequest);
    }

    /**
     * 概要：指定したfolder及びその中全部ファイルを削除
     *
     * @param folderName
     * @param client
     */
    public static void deleteFolder(String folderName, AmazonS3 client) {
        List<S3ObjectSummary> fileList = client.listObjects(bucketName, folderName).getObjectSummaries();
        for (S3ObjectSummary file : fileList) {
            client.deleteObject(bucketName, file.getKey());
        }
        client.deleteObject(bucketName, folderName);
    }

    /**
     * 概要：このpathはs3上にすでにあるかどうかの確認
     *
     * @param thisS3FloderPath
     * @return
     */
    public static Boolean getS3FloderExistFlag(String thisS3FloderPath) {
        if (!"/".equals(thisS3FloderPath.substring(thisS3FloderPath.length() - 2, thisS3FloderPath.length() - 1))) {
            thisS3FloderPath = thisS3FloderPath + "/";
        }
        Boolean res = false;

        List<String> allPath = listAll(bucketName);
        if (allPath != null) {
            for (int i = 0; i < allPath.size(); i++) {
                if (allPath.get(i).equals(thisS3FloderPath) || allPath.get(i).equals(thisS3FloderPath + SEPARATOR)) {
                    res = true;
                    break;
                }
            }
        }

        return res;
    }

    /**
     * 概要：s3 上指定したbucketNameの全ファイルを取り出す
     *
     * @param bucketName S3上のbucketNameを指定
     *
     * @return allPath bucket下全ファイルのpathを取り出す
     */
    public static List<String> listAll(String bucketName) {
        List<String> allPath = new ArrayList<String>();

        // AmazonS3Clientインスタンスを作成
        AmazonS3Client client = makeS3Client();

        // Endpointの生成
        //        client.setEndpoint(ENDPOINT);

        ObjectListing objects = client.listObjects(bucketName);
        do {
            for (S3ObjectSummary objectSummary : objects.getObjectSummaries()) {
                allPath.add(objectSummary.getKey());
            }
            objects = client.listNextBatchOfObjects(objects);
        } while (objects.isTruncated());

        return allPath;
    }

    /**
     * 概要：ファイルの大きさ制限を取得
     *
     * @return
     */
    public static long getPartSize() {

        return PART_SIZE;
    }

    /**
     * 概要：AmazonS3Clientをインスタンス化（AmazonS3に接続）
     *
     * accessKey
     * accessSecretKey
     * @return
     */
    private static AmazonS3Client makeS3Client() {

        // 認証オブジェクトを作成
        AWSCredentials credentials = new BasicAWSCredentials(accessKey, accessSecretKey);

        // ConfigurationでTimeout時間を30秒に設定
        ClientConfiguration clientConfiguration = new ClientConfiguration();
        clientConfiguration.setConnectionTimeout(connectionTimeout);

        // AmazonS3Clientをインスタンス化
        return new AmazonS3Client(credentials, clientConfiguration);
    }

    /**
     * 概要：契約書ファイル名を作成
     *
     * @param moushikomiNo 申込番号
     * @param hanNum 版数
     * @return 契約書ファイル名
     */
//    public static String createContractName(String moushikomiNo, String hanNum) {
//
//        return PDFFileBuildUtil.getPdfFileName(moushikomiNo, hanNum);
//    }

    /**
     * 概要：契約書パスを作成
     *
     * @param functionId 機能ID
     * @param moushikomiDate 申込日
     * @param moushikomiNo 申込番号
     * @param hanNum 版数
     * @return 契約書ファイル名
     */
//    public static String createContractPath(String functionId, String moushikomiDate, String moushikomiNo,
//            String hanNum) {
//        if (StringUtils.isEmpty(functionId) || StringUtils.isEmpty(moushikomiDate) || StringUtils.isEmpty(moushikomiNo)
//                || StringUtils.isEmpty(hanNum)) {
//            return null;
//        }
//        StringBuilder path = new StringBuilder(PDFFileBuildUtil.getS3FloderPath(functionId, moushikomiDate));
//        path.append(SEPARATOR);
//        path.append(createContractName(moushikomiNo, hanNum));
//        return path.toString();
//    }

    /**
     * 概要：契約書パスを作成
     *
     * @param functionId 機能ID
     * @param moushikomiDate 申込日
     * @param moushikomiNo 申込番号
     * @param hanNum 版数
     * @return 契約書ファイル名
     */
//    public static String createContractPath(String functionId, Date moushikomiDate, String moushikomiNo,
//            String hanNum) {
//        if (StringUtils.isEmpty(functionId) || moushikomiDate == null || StringUtils.isEmpty(moushikomiNo)
//                || StringUtils.isEmpty(hanNum)) {
//            return null;
//        }
//        return createContractPath(functionId, DateFormatUtils.format(moushikomiDate, "yyyyMM"), moushikomiNo,
//                hanNum);
//    }

    /**
     * 概要：添付ファイルパスを作成
     *
     * @param functionId 機能ID
     * @param moushikomiDate 申込日
     * @param moushikomiNo 申込番号
     * @param fileName ファイル名
     * @return 添付ファイルパス
     */
    public static String createAttachfilePath(String functionId, String moushikomiDate, String moushikomiNo,
            String fileName) {
        if (StringUtils.isEmpty(functionId) || StringUtils.isEmpty(moushikomiDate) || StringUtils.isEmpty(moushikomiNo)
                || StringUtils.isEmpty(fileName)) {
            return null;
        }
        StringBuilder path = new StringBuilder(ATTACHFILE_PATH);
        path.append(functionId);
        path.append(SEPARATOR);
        path.append(moushikomiDate.replace(SEPARATOR, "").substring(0, 6));
        path.append(SEPARATOR);
        path.append(moushikomiNo);
        path.append(SEPARATOR);
        path.append(fileName);
        return path.toString();
    }

    /**
     * 概要：添付ファイルパスを作成
     *
     * @param functionId 機能ID
     * @param moushikomiDate 申込日
     * @param moushikomiNo 申込番号
     * @param fileName ファイル名
     * @return 添付ファイルパス
     */
    public static String createAttachfilePath(String functionId, Date moushikomiDate, String moushikomiNo,
            String fileName) {
        if (StringUtils.isEmpty(functionId) || moushikomiDate == null || StringUtils.isEmpty(moushikomiNo)
                || StringUtils.isEmpty(fileName)) {
            return null;
        }

        return createAttachfilePath(functionId, DateFormatUtils.format(moushikomiDate, "yyyyMM"), moushikomiNo,
                fileName);
    }

}
