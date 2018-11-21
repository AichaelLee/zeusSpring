package com.lzz.util;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import sun.misc.RegexpPool;

import java.io.IOException;
import java.net.*;
import java.util.Arrays;
import java.util.List;
import java.util.StringTokenizer;

public class CustomProxySelector extends ProxySelector {
    private static final Logger logger = LoggerFactory.getLogger(CustomProxySelector.class);

    private static final String FIXIE_SOCKS_HOST = System.getenv("FIXIE_SOCKS_HOST");

    private static final String PROXY_SOCKS_HOST = System.getenv("PROXY_SOCKS_HOST");

    private String fixieHost;

    private int fixiePort;

    private Proxy scoksProxy;

    private RegexpPool pool;

    public CustomProxySelector() throws MalformedURLException {

        if (StringUtils.isNotEmpty(FIXIE_SOCKS_HOST)) {
            URL fixie = new URL("http://" + FIXIE_SOCKS_HOST);

            // プロキシのホスト取得
            fixieHost = fixie.getHost();
            fixiePort = fixie.getPort();

            scoksProxy = new Proxy(Proxy.Type.SOCKS,
                    new InetSocketAddress(fixieHost, fixiePort));
        }

        if (StringUtils.isNotEmpty(PROXY_SOCKS_HOST)) {
            pool = new RegexpPool();
            StringTokenizer st = new StringTokenizer(PROXY_SOCKS_HOST, "|", false);
            try {
                while (st.hasMoreTokens()) {
                    pool.add(st.nextToken().toLowerCase(), Boolean.TRUE);
                }
            } catch (sun.misc.REException ex) {
            }
        }

    }

    @Override
    public void connectFailed(URI uri, SocketAddress address, IOException e) {

        logger.error("ProxySelector", e);
    }

    @Override
    public List<Proxy> select(URI uri) {

        String host = uri.getHost();

        if (pool != null && scoksProxy != null
                && pool.match(host) != null) {
            // set proxy
            return Arrays.asList(scoksProxy);
        }

        return Arrays.asList(Proxy.NO_PROXY);
    }
}
