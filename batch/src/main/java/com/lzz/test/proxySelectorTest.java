package com.lzz.test;

import com.lzz.util.CustomProxySelector;

import java.net.*;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * オンライン開始
 *
 */
public class proxySelectorTest {
    private static final String SPRING_CONFIG_FILE = "classpath:applicationContext.xml";
    private static final Set<String> AVAILABLE_FONT_FACE_NAMES = new HashSet<String>();

    /**
     * オンライン開始メイン
     *
     * @param args パラメータ
     * @throws MalformedURLException
     */
    public static void main(String[] args) throws MalformedURLException {

    	URL fixie = new URL("http://"+System.getenv("FIXIE_SOCKS_HOST"));
		String fixieInfo = fixie.getUserInfo();
		System.out.println("fixieURL ==> "+fixieInfo);
		String[] fixieUserInfo = fixieInfo.split(":");
		String fixieUser = fixieUserInfo[0];
		String fixiePassword = fixieUserInfo[1];


        CustomProxySelector proxySelector = new CustomProxySelector();
        ProxySelector.setDefault(proxySelector);
        //set proxy authentication globally
        Authenticator.setDefault(new Authenticator() {
            @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fixieUser, fixiePassword
                            .toCharArray());
                }
            });


        try {

            ProxySelector ps = ProxySelector.getDefault();
            // get proxy list
            List<Proxy> proxyList = ps.select(URI.create("/"));
            // 代理类
            System.out.println(proxyList.get(0));

        } catch (Exception e) {
            //exitCode = BatchConstant.STATUS.FAILURE;

        } finally {
            // context.close();
        }

        //System.exit(exitCode);
    }
}
