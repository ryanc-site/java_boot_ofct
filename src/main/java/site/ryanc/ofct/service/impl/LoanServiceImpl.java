package site.ryanc.ofct.service.impl;

import cn.afterturn.easypoi.word.WordExportUtil;
import cn.hutool.core.io.FileUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.springframework.stereotype.Service;
import site.ryanc.ofct.common.util.HtmlUtil;
import site.ryanc.ofct.mapper.LoanMapper;
import site.ryanc.ofct.model.LoanInfo;
import site.ryanc.ofct.model.PersonCustomer;
import site.ryanc.ofct.ofct_boot;
import site.ryanc.ofct.service.LoanService;

import javax.annotation.Resource;
import java.io.*;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import static site.ryanc.ofct.common.consts.Constant.*;

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
@Slf4j
@Service
public class LoanServiceImpl extends BaseServiceImpl<LoanInfo,String> implements LoanService {

    @Resource
    private LoanMapper loanMapper;

    @Override
    public PageInfo<LoanInfo> selectByKeyWord(Map<String, Object> paraMap) {
        Integer pageNum = (Integer) paraMap.get("page");
        Integer pageSize = (Integer) paraMap.get("limit");
        String keyWord = (String) paraMap.get("keyword");
        String csr_type = (String) paraMap.get("csr_type");
        pageNum = pageNum > 0 ? pageNum : defaultPageNum;
        pageSize = pageSize > 0 ? pageSize : defaultPageSize;
        PageHelper.startPage(pageNum, pageSize);
        return new PageInfo(loanMapper.selectByKeyWord(keyWord,csr_type));
    }

    @Override
    public void export(PersonCustomer csrForLoanFromDb, LoanInfo loan_db, String exportDir) throws Exception {
        Map<String,String> replaceFileMap = new HashMap<>();
        replaceFileMap.putAll(template_base_Map);
        // 贷款方式 - 对应文件列表
        if(loan_db.getLoan_mode() == 2){
            // 加入 循环 对应的文件列表
            replaceFileMap.putAll(template_loop_mode_loan_map);
        }else if(loan_db.getLoan_mode() == 3){
            // 加入 特色产品 对应的文件列表
            replaceFileMap.putAll(template_special_prod_loan_map);
        }

        // 支付方式对应文件列表
        if(loan_db.getLoan_pay_mode() == 1){
            replaceFileMap.putAll(template_self_pay_loan_map);
        }else if(loan_db.getLoan_pay_mode() == 2){
            // 加入 委托支付 对应文件列表
            replaceFileMap.putAll(template_entrust_pay_loan_map);
        }

        Set<Map.Entry<String, String>> entries = replaceFileMap.entrySet();
        for (Map.Entry<String, String> entry : entries) {
            // 获取模板文件
            String templatePath_A = ofct_boot.class.getResource("/").getPath() + "/template/" + entry.getKey();
            File templateFile_A = new File(templatePath_A);

            // 读取模板
            InputStream in = new FileInputStream(templateFile_A);
            OPCPackage srcPackage = OPCPackage.open(in);
            XWPFDocument doc = new XWPFDocument(srcPackage);

            Iterator<XWPFTable> it = doc.getTablesIterator();
            //表格内容替换添加
            Map<String, Object> replaceMap = createParaParamsMap(loan_db, csrForLoanFromDb);
            XWPFDocument targetDoc = null;
            try {
                targetDoc = WordExportUtil.exportWord07(templatePath_A, replaceMap);
            } catch (Exception e) {
                throw new Exception(entry.getKey() + "导出异常：" + e.getMessage());
            }
            // 输出目标文件
            File file = new File(exportDir);
            //如果文件夹不存在则创建
            if (!file.exists()) {
                FileUtil.mkdir(file);
            }
            String targetPath_A = exportDir + "/" + entry.getValue();
            OutputStream targetOS_A = new FileOutputStream(targetPath_A);
            targetDoc.write(targetOS_A);
            // 关闭流
            HtmlUtil.closeStream(in, targetOS_A);
            log.info("file handl successfully.result file in  =====>" + targetPath_A + " )");
        }
    }
    /**
     * 创建文本占位符需要替换的内容
     *
     * @return
     */
    public  Map<String, Object> createParaParamsMap(LoanInfo loanInfo, PersonCustomer customerInfo) {
        Map<String, Object> map = new HashMap<>();
        map.put("-dj-dk-jkr-xm", customerInfo.getP_name());
        map.put("-dj-dk-bzfs", display_Loan_assure_type(loanInfo.getLoan_assure_type()));
        map.put("-zh-dk-jkje-dx", loanInfo.getLoan_amount_upcase());
        map.put("-zh-dk-jkje-xx", String.valueOf(loanInfo.getLoan_amount_lowcase()));
        map.put("-zh-dk-dkqx", String.valueOf(loanInfo.getLoan_term()));
        map.put("-dj-dk-jkr-xb", display_gender(Integer.parseInt(customerInfo.getP_gender())));
        map.put("-dj-dk-jkr-sfz", customerInfo.getP_id());
        map.put("-dj-dk-jkr-jzdz", customerInfo.getP_dwell_add());
        map.put("-dj-dk-jkr-dh", customerInfo.getP_tel());
        map.put("-dj-dk-jkr-sfzdz", customerInfo.getP_id_add());
        map.put("-dj-dk-jkr-zyhy", customerInfo.getP_job());
        map.put("-dj-dk-jkr-jydz", customerInfo.getP_work_add());
        map.put("-dj-dk-jkr-zzc", customerInfo.getP_total_asset());
        map.put("-dj-dk-jkr-zfz", customerInfo.getP_total_debt());
        map.put("-dj-dk-jkr-jzc", customerInfo.getP_net_asset());
        map.put("-dj-dk-jkr-qnjtjsr", customerInfo.getP_last_year_family_net_asset());
        map.put("-dj-dk-yt", loanInfo.getLoan_for_use());
        map.put("-zh-dk-hkly", loanInfo.getLoan_repay_src());
        map.put("-zh-dk-qsrq", loanInfo.getLoan_start_date());
        map.put("-zh-dk-zzrq", loanInfo.getLoan_end_date());
        map.put("-zh-dk-sqr", loanInfo.getLoan_apply_time());
        map.put("-zh-dk-hkfs", display_Loan_repay_mode(loanInfo.getLoan_repay_mode()));
        map.put("-zh-dk-zhth", loanInfo.getLoan_main_contractno());
        map.put("-zh-dk-chth", loanInfo.getLoan_sub_contractno());
        map.put("-zh-dk-htr", loanInfo.getLoan_contract_date());
        map.put("-dj-dk-jkr-hjdz", customerInfo.getP_hukou_add());
        map.put("-dj-kh-dh", customerInfo.getP_tel());

        // 保证信息
        map.put("-zh-dk-bzr-xm", loanInfo.getLoan_assure_person());
        map.put("-dj-dk-bzr-xb", display_gender(Integer.parseInt(loanInfo.getLoan_assure_person_gender())));
        map.put("-dj-dk-bzr-jzdz", loanInfo.getLoan_person_address());
        map.put("-dj-dk-bzr-sfz", loanInfo.getLoan_person_id());

        // 贷款方式：循环方式 ==> 附加项
        map.put("-dj-dk-bcqsrq", loanInfo.getLoan_this_start_date());
        map.put("-dj-dk-bczzrq", loanInfo.getLoan_this_end_date());
        map.put("-dj-dk-bcjkys", loanInfo.getLoan_this_months());
        // 贷款方式：特色产品 ==> 附加项
        map.put("-dj-dk-stcp", loanInfo.getLoan_special_prod_type());
        map.put("-dj-dkr-khlx", loanInfo.getLoan_borrower_type());
        // 支付方式：委托 ==> 附加项
        map.put("-dj-dk-wt-rq", loanInfo.getLoan_entrust_pay_date());
        map.put("-dj-dk-wt-je", loanInfo.getLoan_entrust_pay_amount());
        map.put("-dj-dk-wt-skdw", loanInfo.getLoan_entrust_pay_payee());
        map.put("-dj-dk-wt-skzh", loanInfo.getLoan_entrust_pay_receipt_account());
        map.put("-dj-dk-wt-khh", loanInfo.getLoan_entrust_pay_receipt_deposit());

        map.put("-zh-dk-yll", loanInfo.getLoan_m_rate());
        map.put("-dj-dk-zffs", display_Loan_pay_mode(loanInfo.getLoan_pay_mode()));
        map.put("-zh-dk-lljd", loanInfo.getLoan_rate_plus_point());
        map.put("-zh-dk-sp", loanInfo.getLoan_approve_time());
        map.put("-zh-dk-zsxje", String.valueOf(loanInfo.getLoan_total_credit_amount()));
        map.put("-zh-dk-dshrs", String.valueOf(loanInfo.getLoan_review_person_num()));
        map.put("-zh-dk-yhkh", loanInfo.getLoan_person_carno());
        map.put("-dj-dk-yhkkhh", loanInfo.getLoan_account_open_bank());
        map.put("-dj-dk-jkr-csrq", displayBirthDate(customerInfo.getP_id()));
        map.put("-dj-dk-ghzr", loanInfo.getLoan_steward_responsible());
        map.put("-dj-dk-fxzzr", loanInfo.getLoan_risk_responsible());
        map.put("-dj-loan_mode", echo_loan_mode(loanInfo.getLoan_mode()));
        map.put("-dj-special-prod-type", echo_special_prod(loanInfo.getLoan_special_prod_type()));
        map.put("-dj-borrower-type", echo_borrower_type(loanInfo.getLoan_borrower_type()));

        return map;
    }

    private  String echo_loan_mode(Integer type){
        String result = "";
        switch (type) {
            case 1: {
                result = "√一次性 □循环";
                break;
            }
            case 2: {
                result = "□一次性 √循环";
                break;
            }
        }
        return result;
    }
    private  String echo_special_prod(Integer type){
        String result = "";
        switch (type) {
            case 1: {
                result = "□农贷宝 □消贷宝 √商贷宝";
                break;
            }
            case 2: {
                result = "□农贷宝 √消贷宝 □商贷宝";
                break;
            }
            case 3: {
                result = "√农贷宝 □消贷宝 □商贷宝";
                break;
            }
        }
        return result;
    }
    private  String echo_borrower_type(Integer type){
        String result = "";
        switch (type) {
            case 1: {
                result = "√农户 □个体工商户 □自然人";
                break;
            }
            case 2: {
                result = "□农户 □个体工商户 √自然人";
                break;
            }
            case 3: {
                result = "□农户 √个体工商户 □自然人";
                break;
            }
        }
        return result;
    }

    private  String display_Loan_repay_mode(Integer type) {
        String result = "";
        switch (type) {
            case 1: {
                result = "等额本息";
                break;
            }
            case 2: {
                result = "等额本金";
                break;
            }
            case 3: {
                result = "按月结息";
                break;
            }
            case 4: {
                result = "到期还本、计划还款";
                break;
            }
        }
        return result;
    }

    private  String display_Loan_assure_type(Integer type) {
        String result = "";
        switch (type) {
            case 1: {
                result = "抵押";
                break;
            }
            case 2: {
                result = "保证";
                break;
            }
            case 3: {
                result = "信用";
                break;
            }
            case 4: {
                result = "质押";
                break;
            }
        }
        return result;
    }

    private  String display_Loan_pay_mode(Integer type) {
        String result = "";
        switch (type) {
            case 1: {
                result = "自主支付";
                break;
            }
            case 2: {
                result = "委托支付";
                break;
            }
        }
        return result;
    }

    private  String display_gender(Integer type) {
        String result = "";
        switch (type) {
            case 1: {
                result = "男";
                break;
            }
            case 0: {
                result = "女";
                break;
            }
        }
        return result;
    }

    public  String displayBirthDate(String strID) {
        String strYear = "";
        String strMonth = "";
        String strDay = "";

        if (strID.length() == 15) {
            strYear = "19" + strID.substring(6, 8);
            strMonth = strID.substring(8, 10);
            strDay = strID.substring(10, 12);
        }

        if (strID.length() == 18) {
            strYear = strID.substring(6, 10);
            strMonth = strID.substring(10, 12);
            strDay = strID.substring(12, 14);
        }
        return strYear + "/" + strMonth + "/" + strDay + "/";
    }


}
