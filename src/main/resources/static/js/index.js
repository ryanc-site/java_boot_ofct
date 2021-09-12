// 左侧菜单点击事件
function left_menu_click(bussinessType,ele){
    if (bussinessType === 'customer'){
        var sub_display = ele.sub_display;
        var inHtml = ele.innerHTML;
        if(sub_display === 'on'){
            ele.sub_display = 'off';
            ele.innerHTML=inHtml.replace("∨","<")
            $('#'+bussinessType+'_sub').hide();
        }else{
            ele.sub_display = 'on'
            ele.innerHTML=inHtml.replace("&lt;","∨")
            $('#'+bussinessType+'_sub').show();
        }
    }
}