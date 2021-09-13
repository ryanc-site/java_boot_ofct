// 转义 - 性别
function displayGender(gender){
    var genderDisplay = "";
    switch(gender){
        case '1':
            genderDisplay = "男";
            break;
        case '0':
            genderDisplay = "女";
            break;
        default:
            genderDisplay = "其他";
    }
    return genderDisplay;
}

// 转义 - 婚姻情况
function displayMarital(marital){
    var maritalDisplay = "";
    switch(marital){
        case '1':
            maritalDisplay = "已婚";
            break;
        case '2':
            maritalDisplay = "未婚";
            break;
        // case '2':
        //     maritalDisplay = "离异";
        //     break;
        // case '3':
        //     maritalDisplay = "丧偶";
        //     break;
    }
    return maritalDisplay;
}

// 转义 - 客户方式
function display_customer(type) {
    var result = "";
    switch (type) {
        case 1: {
            result = "个人";
            break;
        }
        case 0: {
            result = "公司";
            break;
        }
    }
    return result;
}

// 转义 - 贷款方式
function display_loan_mode(type) {
    var result = "";
    switch (type) {
        case 1: {
            result = "一次性";
            break;
        }
        case 2: {
            result = "循环";
            break;
        }
        case 3: {
            result = "特色产品";
            break;
        }
    }
    return result;
}

// 转义 - 保证方式
function display_Loan_assure_type(type) {
    var result = "";
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

// 转义 - 支付方式
function display_Loan_pay_mode(type) {
    var result = "";
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

