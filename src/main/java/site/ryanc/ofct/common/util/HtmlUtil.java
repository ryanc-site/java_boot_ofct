package site.ryanc.ofct.common.util;

import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.util.Units;
import org.apache.poi.xwpf.usermodel.*;
import org.apache.xmlbeans.XmlCursor;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import site.ryanc.ofct.common.consts.ElementEnum;

import java.io.*;

import static site.ryanc.ofct.common.consts.Constant.COMMONATTR;


/**
 * Html工具类
 * @author corey
 * @version 1.0
 * @date 2020/5/5 9:36 下午
 */
public class HtmlUtil {

    /**
     * 给document添加指定元素
     * @param document
     */
    public static void addElement(Document document){
        if(ObjectUtils.isEmpty(document)){
            throw new NullPointerException("不允许为空的对象添加元素");
        }
        Elements elements = document.getAllElements();
        for(Element e:elements){
            String attrName = ElementEnum.getValueByCode(e.tag().getName());
            if(!StringUtils.isEmpty(attrName)) {
                e.attr(COMMONATTR, attrName);
            }
        }
    }


    /**
     * 读取txt文件的内容
     *
     * @param file 想要读取的文件对象
     * @return 返回文件内容
     */
    public static String txt2String(File file) {
        StringBuilder result = new StringBuilder();
        try {
            BufferedReader br = new BufferedReader(new FileReader(file));//构造一个BufferedReader类来读取文件
            String s = null;
            while ((s = br.readLine()) != null) {//使用readLine方法，一次读一行
                result.append(System.lineSeparator() + s);
            }
            br.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result.toString();
    }



    /**
     *   将富文本的表格转换为Word里面的表格
     */
    private static void addTable(XWPFTable xwpfTable,Element table) {
        Elements trs = table.getElementsByTag("tr");
        // XWPFTableRow 第0行特殊处理
        int rownum = 0;
        for (Element tr : trs) {
            addTableTr(xwpfTable,tr,rownum);
            rownum++;
        }
    }

    /**
     *  将元素里面的tr 提取到 xwpfTabel
     */
    private static void addTableTr(XWPFTable xwpfTable,Element tr,int rownum) {
        Elements tds = tr.getElementsByTag("th").isEmpty() ? tr.getElementsByTag("td") : tr.getElementsByTag("th");
        XWPFTableRow row_1 = null;
        for (int i = 0, j = tds.size(); i < j; i++) {
            if(0==rownum){
                // XWPFTableRow 第0行特殊处理,
                XWPFTableRow row_0 = xwpfTable.getRow(0);
                if(i==0){
                    row_0.getCell(0).setText(tds.get(i).text());
                }else{
                    row_0.addNewTableCell().setText(tds.get(i).text());
                }
            }else{
                if(i==0) {
                    // 换行需要创建一个新行
                    row_1 = xwpfTable.createRow();
                    row_1.getCell(i).setText(tds.get(i).text());
                }else {
                    row_1.getCell(i).setText(tds.get(i).text());
                }
            }
        }

    }

    /**
     * 关闭输入流
     *
     * @param closeables
     */
    public static void closeStream(Closeable... closeables) {
        for (Closeable  c: closeables) {
            if (c != null) {
                try {
                    c.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

    }


}
