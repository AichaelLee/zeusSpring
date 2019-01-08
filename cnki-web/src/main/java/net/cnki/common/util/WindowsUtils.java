package net.cnki.common.util;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.Charset;

import ch.ethz.ssh2.Connection;
import ch.ethz.ssh2.Session;

/**
 * windows\ssh2 执行命令工具类
 * @author to
 *
 */
public class WindowsUtils {
	
	private Connection conn;
	private String ipAddr;
	private String charset = Charset.defaultCharset().toString();
	private String userName;
	private String password;
 
	public WindowsUtils(String ipAddr, String userName, String password,
			String charset) {
		this.ipAddr = ipAddr;
		this.userName = userName;
		this.password = password;
		if (charset != null) {
			this.charset = charset;
		}
	}
	
	/**
	 * 直接执行服务器命令
	 * 命令示例 ："cmd /c mysqldump -h 127.0.0.1 testdata -uroot -proot --add-drop-table | mysql -h 192.168.100.66 testdata -uroot -proot"
	 * @param strCMD
	 * @return
	 */
	public static boolean execCMD(String strCMD){
		boolean flag=false;
		Runtime rt = Runtime.getRuntime();
		try {
			Process p = rt.exec(strCMD);
			BufferedReader bufferedReader = new BufferedReader(
                    new InputStreamReader(p.getInputStream()));
            String output = null;
            while ((output = bufferedReader.readLine()) != null){
                System.out.println(output);
            }
            if(p.waitFor()>0){
            	flag =true;
            }else{
            	flag=false;
            }
		
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			 flag=false;
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			flag=false;
		}
		return flag;
	}
	/**
	 * 直接执行服务器命令
	 * 命令示例 ："cmd /c mysqldump -h 127.0.0.1 testdata -uroot -proot --add-drop-table | mysql -h 192.168.100.66 testdata -uroot -proot"
	 * @param strCMD
	 * @return
	 */
	public static Process execCMD(String[] strCMD){
		
		Runtime rt = Runtime.getRuntime();
		try {
			Process p = rt.exec(strCMD);
			return p;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

 
	public boolean login() throws IOException {
		conn = new Connection(ipAddr);
		conn.connect(); // 连接
		return conn.authenticateWithPassword(userName, password); // 认证
	}
 
	/**
	 * ssh连接执行命令，需要初始化对象。
	 * @param cmds
	 * @return
	 */
	public String execSSH(String cmds) {
		InputStream in = null;
		String result = "";
		try {
			if (this.login()) {
				Session session = conn.openSession(); // 打开一个会话
				session.execCommand(cmds);
				
				in = session.getStdout();
				result = this.processStdout(in, this.charset);
				session.close();
				conn.close();
			}
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		return result;
	}
 
	public String processStdout(InputStream in, String charset) {
	
		byte[] buf = new byte[1024];
		StringBuffer sb = new StringBuffer();
		try {
			while (in.read(buf) != -1) {
				sb.append(new String(buf, charset));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return sb.toString();
	}
	
	

}
