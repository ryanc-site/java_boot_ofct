package site.ryanc.ofct.model;

import lombok.Data;

/**
 * +--------------------------------+ <br>
 * | Even in a galaxy far,far away.  | <br>
 * | 即使是在遥远的星河里也一样  !      |<br>
 * +--------------------------------+ <br>
 *
 * @author Ryan
 * @Desc 类描述
 * @createTime 2021年09月12日 11:36:00
 */
@Data
public class ResCom <T>{

    private String code;
    private String msg;
    private T result;

    public ResCom(String code, String msg, T data) {
        this.code = code;
        this.msg = msg;
        this.result = data;
    }
}
