package com.lzz.fw;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;

public class test {
	public static void main(String[] args) {
		String[] arr = {"yyy","ccc","hhh","aaa"};
		Comparator c = new Comparator<String>() {

			@Override
			public int compare(String o1, String o2) {
				return o1.compareTo(o2);
			}
		};
		Arrays.sort(arr, c);
		
		Arrays.sort(arr,Collections.reverseOrder());
		System.out.println("after sort"+Arrays.toString(arr));
        SqlSessionFactory sqlSessionFactory =  null;
        SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
        //sqlSessionFactory  = builder.build();
		
		
	}
}
