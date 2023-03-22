/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package des;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

/**
 *
 * @author cs47
 */
//Aim: Program to find similarities between two documents 
public class PageSimilarity {

    public static void main(String[] args) throws IOException {

        BufferedReader reader1 = new BufferedReader(new FileReader("‪C:/tanmay/file1.txt"));
        BufferedReader reader2 = new BufferedReader(new FileReader("‪‪‪C:/tanmay/file2.txt"));
        String line1 = reader1.readLine();
        String line2 = reader2.readLine();
        boolean areEqual = true;
        int lineNum = 1;
        while (line1 != null || line2 != null) {
            if (line1 == null || line2 == null) {
                System.out.println("Two files have different content. They differ at line " + lineNum);
                System.out.println("File1 has " + line1 + " and file2 has " + line2 + " at line " + lineNum);
                areEqual = false;
            } else if (!line1.equalsIgnoreCase(line2)) {
                System.out.println("Two files have different content. They differ at line " + lineNum);
                System.out.println("File1 has " + line1 + " and file2 has " + line2 + " at line " + lineNum);
                areEqual = false;

            }
            line1 = reader1.readLine();
            line2 = reader2.readLine();
            lineNum++;
        }
        if (areEqual) {
            System.out.println("Two files have same content");
        }
        reader1.close();
        reader2.close();
}
}