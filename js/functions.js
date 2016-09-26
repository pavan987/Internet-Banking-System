// JavaScript Document for validation
function compareDates(dateStr1,dateStr2){
		var datesplit1=dateStr1.split("/");
		var datesplit2=dateStr2.split("/");
		var returnValue = true;
		
		date1 = datesplit1[0];
		month1 =datesplit1[1];
		year1 = datesplit1[2];
	
		date2 = datesplit2[0];
		month2 =datesplit2[1];
		year2 = datesplit2[2];		
				
		if(month1!=null && month1!=''){	
			switch(month1){			
			case 'Jan': monthchk1=01;
					    break;
			case 'Feb': monthchk1=02;
						break;
			case 'Mar': monthchk1=03;
						break;		
			case 'Apr': monthchk1=04;
						break;
			case 'May': monthchk1=05;
						break;		
			case 'Jun': monthchk1=06;
						break;		
			case 'Jul': monthchk1=07;
						break;		
			case 'Aug': monthchk1=08;
						break;		
			case 'Sep':	monthchk1=09;
						break;
			case 'Oct':	monthchk1=10;
						break;		
			case 'Nov': monthchk1=11;
						break;		
			case 'Dec': monthchk1=12;
						break;		
			default :	return;
						break;			
			}		
		}	
		if(month2!=null && month2!=''){	
			switch(month2){			
			case 'Jan': monthchk2=01;
					    break;
			case 'Feb': monthchk2=02;
						break;
			case 'Mar': monthchk2=03;
						break;		
			case 'Apr': monthchk2=04;
						break;
			case 'May': monthchk2=05;
						break;		
			case 'Jun': monthchk2=06;
						break;		
			case 'Jul': monthchk2=07;
						break;		
			case 'Aug': monthchk2=08;
						break;		
			case 'Sep':	monthchk2=09;
						break;
			case 'Oct':	monthchk2=10;
						break;		
			case 'Nov': monthchk2=11;
						break;		
			case 'Dec': monthchk2=12;
						break;		
			default :	return;
						break;			
			}		
		}		
		if(parseInt(year1) > parseInt(year2)){
			returnValue = false;
		}else if(parseInt(year1) == parseInt(year2)){
			if(parseInt(monthchk1) > parseInt(monthchk2)){
				returnValue = false;
			}else if(parseInt(monthchk1)==parseInt(monthchk2)){
				if(parseInt(date1) > parseInt(date2))
					returnValue = false;
			}
		}
	return returnValue;
}

function trim(VALUE)
{
	var w_space = String.fromCharCode(32);
	var v_length = VALUE.length;
	var strTemp = "";
	var iTemp = 0;
	
	if(v_length < 1){
						return"";
					}
	while(iTemp < v_length)
	{
		if(VALUE.charAt(iTemp) == w_space){	}
		else{
			strTemp = VALUE.substring(iTemp,v_length);
			break;
			}
		iTemp = iTemp + 1;
	}
	
	v_length=strTemp.length;
    iTemp = v_length -1;
	
	while(iTemp > -1)
	{
		if(strTemp.charAt(iTemp) == w_space){	}
		else{
			strTemp = strTemp.substring(0,iTemp +1);
			break;
		}
		iTemp = iTemp-1;
	}
	return strTemp;
} 



function validate(value)
{
	var checkOk = "0123456789";
	var checkStr = value;
	var allValid = true;
			
			for (i = 0;  i < checkStr.length;  i++)
				{
					ch = checkStr.charAt(i);
					for (j = 0;  j < checkOk.length;  j++)
						if (ch == checkOk.charAt(j))
						break;
						if (j == checkOk.length)
						{
							allValid = false;
							break;
						}
				}
			
					if (!allValid)
					{
						return (false);
							
					}
					else { return (true); }
}

