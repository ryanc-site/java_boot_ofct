package site.ryanc.ofct.service.impl;

import cn.hutool.core.date.DateUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import site.ryanc.ofct.mapper.P_customerMapper;
import site.ryanc.ofct.model.PersonCustomer;
import site.ryanc.ofct.service.BaseService;
import site.ryanc.ofct.service.P_customerService;

import javax.annotation.Resource;
import java.io.FileInputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;

import static cn.hutool.json.XMLTokener.entity;

/**
 * +--------------------------------+ <br>
 * | Even in a galaxy far,far away.  | <br>
 * | 即使是在遥远的星河里也一样  !      |<br>
 * +--------------------------------+ <br>
 *
 * @author Ryan
 * @Desc 个人客户 - serviceImpl
 * @createTime 2021年09月12日 08:40:00
 */
@Service
public class P_customerServiceImpl extends BaseServiceImpl<PersonCustomer, String> implements P_customerService {

    @Resource
    private P_customerMapper p_customerMapper;

    @Override
    public PageInfo<PersonCustomer> selectByKeyWord(Map<String, Object> paraMap) {
        Integer pageNum = (Integer) paraMap.get("page");
        Integer pageSize = (Integer) paraMap.get("limit");
        String keyWord = (String) paraMap.get("keyword");
        String starTime = (String) paraMap.get("starTime");
        String endTime = (String) paraMap.get("endTime");
        pageNum = pageNum > 0 ? pageNum : defaultPageNum;
        pageSize = pageSize > 0 ? pageSize : defaultPageSize;
        PageHelper.startPage(pageNum, pageSize);
        return new PageInfo(p_customerMapper.selectByKeyWord(keyWord, starTime, endTime));
    }

    @Override
    public PersonCustomer getByCsrName(String csr_name) {
        return p_customerMapper.selectByCsrName(csr_name);
    }

    @Override
    public PersonCustomer importCsr(String csr_type, MultipartFile import_file) throws Exception {
        FileInputStream in = (FileInputStream) import_file.getInputStream();//载入文档
        PersonCustomer person = new PersonCustomer();
        //word 2007 图片不会被读取， 表格中的数据会被放在字符串的最后
        XWPFDocument xwpf = new XWPFDocument(in);//得到word文档的信息
        List<XWPFTable> tables = xwpf.getTables();
        // 姓名
        String p_name = tables.get(0).getRows().get(0).getTableCells().get(0).getTables().get(2).getRows().get(1).getTableCells().get(1).getText();
        person.setP_name(p_name);
        // 性别
        String p_gender = tables.get(0).getRows().get(0).getTableCells().get(0).getTables().get(2).getRows().get(1).getTableCells().get(3).getText();
        person.setP_gender((p_gender.contains("男")) ? "1" : "0");
        // 身份证
        String p_id = tables.get(0).getRows().get(0).getTableCells().get(0).getTables().get(2).getRows().get(1).getTableCells().get(5).getText();
        person.setP_id(p_id);
        // 婚姻情况
        String p_marital = tables.get(0).getRows().get(0).getTableCells().get(0).getTables().get(2).getRows().get(2).getTableCells().get(1).getText();
        person.setP_marital((p_marital.contains("已")) ? "1" : "2");
        // 电话
        String p_tel = tables.get(0).getRows().get(0).getTableCells().get(0).getTables().get(2).getRows().get(2).getTableCells().get(5).getText();
        person.setP_tel(p_tel);
        // 现住址
        String p_dwell_add = tables.get(0).getRows().get(0).getTableCells().get(0).getTables().get(2).getRows().get(5).getTableCells().get(3).getText();
        person.setP_dwell_add(p_dwell_add);
        return person;
    }

}
