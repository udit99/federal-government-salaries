var GovSalaries = GovSalaries || {};
GovSalaries.utilities = GovSalaries.utilities || {};
GovSalaries.utilities.parseQueryParams = function(){
  var vars = [], hash;
  var q = document.URL.split('?')[1];
  if(q != undefined){
    q = q.split('&');
    for(var i = 0; i < q.length; i++){
      hash = q[i].split('=');
      vars.push(hash[1]);
      vars[hash[0]] = hash[1];
    }
  }
  return vars;
};
