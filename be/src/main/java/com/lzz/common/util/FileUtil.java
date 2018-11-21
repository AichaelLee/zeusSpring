package com.lzz.common.util;

import com.amazonaws.services.s3.model.S3Object;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.CollectionUtils;

import java.io.*;
import java.nio.charset.Charset;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * ファイル機能
 *
 * @author
 */
public class FileUtil {

    private static final Logger logger = LoggerFactory.getLogger(FileUtil.class);
    private static final String TEMP_DIR = "./forLocalTempFloderForUpload";

    /**
     * テンプレートフォルダ取得
     *
     * @param sessionId セッションID
     * @param tabId タブID
     * @return テンプレートフォルダ
     */
    public static String getTempDirPath(String sessionId, String tabId) {
        return TEMP_DIR + File.separator + sessionId + File.separator + tabId
                + File.separator;
    }

    /**
     * テンプレートファイル削除
     *
     * @param sessionId セッションID
     * @param tabId タブID
     * @param fileName ファイル名
     * @throws IOException
     */
    public static void deleteTempDir(String sessionId, String tabId, String fileName) throws IOException {
        File file = new File(getTempDirPath(sessionId, tabId) + fileName);
        FileUtils.deleteQuietly(file);
    }

    /**
     * 引数で指定したDirをZipファイルに圧縮する
     *
     * @param targetDir 対象のディレクトリ
     * @param zipFullPath 作成するZipファイルのするパス
     * @return ZIPファイル
     * @throws Exception
     */
    public static File compressToZip(File targetDir, String zipFullPath) throws Exception {
        File zipFile = new File(zipFullPath);
        try (ZipOutputStream zos = new ZipOutputStream(
                new BufferedOutputStream(new FileOutputStream(zipFile)), Charset.forName("Windows-31j"));) {
            createZip(zos, targetDir, targetDir.getAbsolutePath());
        } catch (IOException e) {
            logger.error("ZIP圧縮に失敗しました。");
            throw new Exception(e);
        }
        return zipFile;
    }

    /**
     * リストに設定されているS3ファイルをZIPに圧縮して戻す
     *
     * @param os アウトプットストリーム
     * @param s3List アマゾンS3のリスト
     * @throws Exception
     */
    public static void compressToZip(OutputStream os, List<S3Object> s3List) throws Exception {
        // 圧縮対象のファイルが存在しない場合は、処理を終了する
        if (CollectionUtils.isEmpty(s3List)) {
            return;
        }

        try (ZipOutputStream zos = new ZipOutputStream(os, Charset.forName("Windows-31j"));) {
            for (S3Object s3Object : s3List) {
                archive(zos, s3Object);
            }
        } catch (IOException e) {
            logger.error("ZIP圧縮に失敗しました。");
            throw new Exception(e);
        }
    }

    /**
     * ZIPファイルを作成
     *
     * @param zos ZIPのアウトプットストリーム
     * @param target 圧縮対象のファイル
     * @param rootPath 圧縮元のルートパス
     * @throws IOException
     */
    private static void createZip(ZipOutputStream zos, File target, String rootPath) throws IOException {
        // ディレクトリの場合、そのディレクトリ内のファイルを圧縮対象とする
        if (target.isDirectory()) {
            File[] files = target.listFiles();

            // ディレクトリ内にファイルがない場合、ディレクトリを書き込む
            if (files.length <= 0) {
                archive(zos, target, rootPath);
            } else {
                // ディレクトリ内にファイル、ディレクトリが存在する場合、それらを処理する
                for (File file : files) {
                    createZip(zos, file, rootPath);
                }
            }
        } else {
            // ファイルの場合、そのファイルをZIPファイルに圧縮する
            archive(zos, target, rootPath);
        }
    }

    /**
     * ZIPファイルに書き込む
     *
     * @param zos ZIPアウトプットストリーム
     * @param target 圧縮対象のファイル
     * @param rootPath 圧縮元のルートパス
     * @throws IOException
     */
    private static void archive(ZipOutputStream zos, File target, String rootPath) throws IOException {
        ZipEntry entry = null;
        String zipEntryPath = target.getAbsolutePath().replace(rootPath, "").replace("\\", "/");
        // ディレクトリの場合は、空のディレクトリを書き込むために、後ろに「/」を付ける
        if (target.isDirectory()) {
            if (!StringUtils.endsWith(zipEntryPath, "/")) {
                zipEntryPath += "/";
            }
        }
        entry = new ZipEntry(zipEntryPath);
        entry.setTime(target.lastModified());
        zos.putNextEntry(entry);
        // ファイルの場合のみ書き込む
        if (target.isFile()) {
            FileUtils.copyFile(target, zos);
        }
        zos.closeEntry();
    }

    /**
     * ZIPファイルに書き込む
     *
     * @param zos ZIPアウトプットストリーム
     * @param s3Object アマゾンS3ファイル
     * @throws IOException
     */
    private static void archive(ZipOutputStream zos, S3Object s3Object) throws IOException {
        try (BufferedInputStream is = new BufferedInputStream(s3Object.getObjectContent());) {
            archive(zos, is, FilenameUtils.getName(s3Object.getKey()));
        }
    }

    /**
     * ZIPファイルに書き込む
     *
     * @param zos ZIPアウトプットストリーム
     * @param is インプットストリーム
     * @param fileName ファイル名
     * @throws IOException
     */
    private static void archive(ZipOutputStream zos, InputStream is, String fileName) throws IOException {
        ZipEntry entry = new ZipEntry(fileName);
        zos.putNextEntry(entry);
        IOUtils.copy(is, zos);
        zos.closeEntry();
    }

}