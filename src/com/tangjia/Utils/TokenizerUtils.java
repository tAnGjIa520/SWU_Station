package com.tangjia.Utils;



import javax.xml.transform.Result;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class TokenizerUtils {
    public static Set<String> keySet(String sentence){
        Set<String> set=new HashSet<>();
        int len=sentence.length();
        if (len<=4){
            for (int i = 1; i < len; i++) {
                set.add(sentence.substring(len-i,len));
            }
        }else{
            String subSentence=sentence.substring(len-4);
            int subLen=subSentence.length();
            for (int i = 1; i < 4; i++) {
                set.add(subSentence.substring(subLen-i,subLen));

            }
        }
        return set;

    }
}
