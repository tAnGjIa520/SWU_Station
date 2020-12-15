package img;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.Random;

public class CreateVerificationCodeImage {
	
    private String securityCode;
    public CreateVerificationCodeImage(String securityCode){
        this.securityCode=securityCode;
    }
    //高度
    private static final int CAPTCHA_HEIGHT = 35;
    //宽度
    private static final int CAPTCHA_WIDTH  = 100;
    //数字的长度
    private Random r = new Random();
    //字体
    private String[] fontNames = { "宋体", "华文楷体", "黑体", "华文新魏", "华文隶书", "微软雅黑", "楷体_GB2312" };

//生成随机颜色
    private Color randomColor() {
        int red = r.nextInt(150);
        int green = r.nextInt(150);
        int blue = r.nextInt(150);
        return new Color(red, green, blue);
    }

//生成随机字体
    private  Font randomFont() {
        int index = r.nextInt(fontNames.length);
        String fontName = fontNames[index];
        int style = r.nextInt(4);
        int size = r.nextInt(5) + 24; 
        return new Font(fontName, style, size);
    }

    private  void drawLine(BufferedImage image) {
        int num = 5;// 一共画5条
        Graphics2D g2 = (Graphics2D) image.getGraphics();
        for (int i = 0; i < num; i++) {// 生成两个点的坐标，即4个值
            int x1 = r.nextInt(CAPTCHA_WIDTH);
            int y1 = r.nextInt(CAPTCHA_HEIGHT);
            int x2 = r.nextInt(CAPTCHA_WIDTH);
            int y2 = r.nextInt(CAPTCHA_HEIGHT);
            g2.setStroke(new BasicStroke(1.5F));
            g2.setColor(randomColor()); // 随机生成干扰线颜色
            g2.drawLine(x1, y1, x2, y2);// 画线
        }
    }
    // 创建BufferedImage，生成图片
    public BufferedImage createImage() {
        BufferedImage image = new BufferedImage(CAPTCHA_WIDTH, CAPTCHA_HEIGHT, BufferedImage.TYPE_INT_RGB);
        Graphics2D g2 = (Graphics2D) image.getGraphics();
        // 背景色,白色
        g2.setColor(new Color(255, 255, 255));
        g2.fillRect(0, 0, CAPTCHA_WIDTH, CAPTCHA_HEIGHT);

        // 向图片中画4个字符  String securityCode
        for (int i = 0; i < securityCode.length(); i++) {// 循环四次，每次生成一个字符
            String s = securityCode.charAt(i) + "";// 随机生成一个字母
           // float x = i * 1.0F * CAPTCHA_WIDTH / NUMBER_CNT; // 设置当前字符的x轴坐标
            float x = i * 1.0F * CAPTCHA_WIDTH / 4+7F; // 设置当前字符的x轴坐标
            g2.setFont(randomFont()); // 设置随机字体
            g2.setColor(randomColor()); // 设置随机颜色
            g2.drawString(s, x, CAPTCHA_HEIGHT-7); // 画图,依次将字符写入到图片的相应位置-------------------
        }
        drawLine(image); // 添加干扰线
        return image;
    }
}
