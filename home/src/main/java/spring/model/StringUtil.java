package spring.model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class StringUtil {
	public static String createRandomString(int length) {
		List<Integer> list = new ArrayList<>();
		
		for(int i='a'; i<='z'; i++) list.add(i);
		for(int i='A'; i<='Z'; i++) list.add(i);
		for(int i='0'; i<='9'; i++) list.add(i);
		
		Collections.shuffle(list);
		
		StringBuffer buffer = new StringBuffer();
		for(int i=0; i<length; i++) {
			int random = (int)(Math.random() * list.size());
			buffer.append((char)list.get(random).intValue());//겹치는 문자 가능
//			buffer.append((char)list.get(i).intValue());//겹치는 문자 불가능
		}
		return buffer.toString();
	}
}







