package com.learn.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import javax.imageio.stream.FileImageOutputStream;

public class Helper {

    // method to delete profile picture from pics path folder
    public static boolean deleteFile(String path) {

        boolean val = false;
        try {
                
                // file object created to get path of profile picture filename (default.png -> new_pic.png)
                File file = new File(path);
                // delete() method for file object returns true if file is deleted successfully and vice versa
                val = file.delete();
                
        } catch (Exception e) {
            e.printStackTrace();
        }

        return val;
    }
    
     // method to save new profile picture in pics path folder
    public static boolean saveFile(InputStream is, String path)
    {
        boolean val = false;
        
        try{
                // byte object to store data of file after reading through InputStream
                byte[] b = new byte[is.available()];
                
                //to read data from file and keep it in byte array
                is.read(b);
                
                // to write data in a file after getting data in byte file using FileOutputStream object on given path
                FileOutputStream fos = new FileOutputStream(path);
                fos.write(b);
                
                fos.flush();
                fos.close();
                
                val = true;
                 
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return val;
    }
}
