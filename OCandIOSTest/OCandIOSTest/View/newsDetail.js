window.onload = function(){

//    alert("汉唐教育");
    
    // 拿到所有的图片
    var allImg = document.getElementsByTagName("img");
//    alert(allImg.length);
    
    // 遍历
    for (var i=0; i<allImg.length; i++) {
    
        // 取出单个图片对象
        var img = allImg[i];
        img.id = i + 1;
        
        // 监听点击
        img.onclick = function(){
        
//            alert('点击了'+this.id+'张')
            // 跳转
//            window.location.href = 'http:www.baidu.com'
            window.location.href = 'zpj:///openCamera'
        }
    }
    
    // 给网页尾部添加一张图片
    var img = document.createElement('img')
    img.src = 'http://meinv.ratoo.net/uploads/allimg/120821/5-120R10J234.jpg'
    document.body.appendChild(img)
    
    img.onclick = function(){
    
        alert("我是美女周秀娜!")
    }
}