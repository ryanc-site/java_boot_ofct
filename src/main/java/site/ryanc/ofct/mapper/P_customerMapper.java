package site.ryanc.ofct.mapper;

import org.apache.ibatis.annotations.Mapper;
import site.ryanc.ofct.mapper.common.BaseMapper;
import site.ryanc.ofct.model.PersonCustomer;

import java.util.List;

/**
 * +--------------------------------+ <br>
 * | Even in a galaxy far,far away.  | <br>
 * | 即使是在遥远的星河里也一样  !      |<br>
 * +--------------------------------+ <br>
 *
 * @author Ryan
 * @Desc 个人客户 - mapper
 * @createTime 2021年09月12日 08:39:00
 */
@Mapper
public interface P_customerMapper extends BaseMapper<PersonCustomer, String> {

    List<PersonCustomer> selectByKeyWord(String keyWord, String starTime, String endTime);
}
