function enable1(val){
    if(val=="NO"){
        document.getElementById('subcategory').disabled = false;
    }else{
        document.getElementById('subcategory').disabled = true;
        document.getElementById('subcategory').selectedIndex = 0;
        document.getElementById('categoryId').disabled = true;
        document.getElementById('categoryId').selectedIndex = 0;
    }

}
function enable3(val){
    if(val=="SI"){
        document.getElementById('categoryId').disabled = false;
    }else{
        document.getElementById('categoryId').disabled = true;
        document.getElementById('categoryId').selectedIndex = 0;
    }
}