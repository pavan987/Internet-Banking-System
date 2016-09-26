//calender
var winCal;
var dtToday=new Date();
var Cal;
var docCal;
var MonthName=["January", "February", "March", "April", "May", "June","July", 
	"August", "September", "October", "November", "December"];
var WeekDayName=["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];	
var exDateTime;


var cnTop="200";
var cnLeft="500";
var WindowTitle ="SecureBank - Calendar";
var WeekChar=2;
var CellWidth=20;
var DateSeparator="/";
var TimeMode=24;

var ShowLongMonth=true;
var ShowMonthYear=true;
var MonthYearColor="#333333";
var WeekHeadColor="#CCCCCC";
var SundayColor="#D2D2D2";
var SaturdayColor="#E6E6E6";
var WeekDayColor="white";
var FontColor="Black";
var TodayColor="#6699CC";
var SelDateColor="#FFFFFF";
var YrSelColor="#333333";
var ThemeBg="..images/table_background.gif";



function NewCal(pCtrl,pFormat,pShowTime,pTimeMode)
{
	Cal=new Calendar(dtToday);
	if ((pShowTime!=null) && (pShowTime))
	{
		// Changed on 26-08-2005	

		Cal.ShowTime=false;
		if ((pTimeMode!=null) &&((pTimeMode=='12')||(pTimeMode=='24')))
		{
			TimeMode=pTimeMode;
		}		
	}	
	if (pCtrl!=null)
		Cal.Ctrl=pCtrl;
	if (pFormat!=null)
		Cal.Format=pFormat.toUpperCase();
	
	exDateTime=document.getElementById(pCtrl).value;
	if (exDateTime!="")
	{
		var Sp1;
		var Sp2; 
		var tSp1;
		var tSp1;
		var strMonth;
		var strDate;
		var strYear;
		var intMonth;
		var YearPattern;
		var strHour;
		var strMinute;
		var strSecond;
		
		Sp1=exDateTime.indexOf(DateSeparator,0)
		Sp2=exDateTime.indexOf(DateSeparator,(parseInt(Sp1)+1));
		
		if ((Cal.Format.toUpperCase()=="DDMMYYYY") || (Cal.Format.toUpperCase()=="DDMMMYYYY"))
		{
			strMonth=exDateTime.substring(Sp1+1,Sp2);
			strDate=exDateTime.substring(0,Sp1);
		}
		else if ((Cal.Format.toUpperCase()=="MMDDYYYY") || (Cal.Format.toUpperCase()=="MMMDDYYYY"))
		{
			strMonth=exDateTime.substring(0,Sp1);
			strDate=exDateTime.substring(Sp1+1,Sp2);
		}
		if (isNaN(strMonth))
			intMonth=Cal.GetMonthIndex(strMonth);
		else
			intMonth=parseInt(strMonth,10)-1;	
		if ((parseInt(intMonth,10)>=0) && (parseInt(intMonth,10)<12))
			Cal.Month=intMonth;
		
		
		if ((parseInt(strDate,10)<=Cal.GetMonDays()) && (parseInt(strDate,10)>=1))
			Cal.Date=strDate;
		
		
		strYear=exDateTime.substring(Sp2+1,Sp2+5);
		YearPattern=/^\d{4}$/;
		if (YearPattern.test(strYear))
			Cal.Year=parseInt(strYear,10);
		
		
		if (Cal.ShowTime==true)
		{
			tSp1=exDateTime.indexOf(":",0)
			tSp2=exDateTime.indexOf(":",(parseInt(tSp1)+1));
			strHour=exDateTime.substring(tSp1,(tSp1)-2);
			Cal.SetHour(strHour);
			strMinute=exDateTime.substring(tSp1+1,tSp2);
			Cal.SetMinute(strMinute);
			strSecond=exDateTime.substring(tSp2+1,tSp2+3);
			Cal.SetSecond(strSecond);
		}	
	}
winCal=window.open("","DatePicker","toolbar=0,status=0,menubar=0,fullscreen=no,width=195,height=228,resizable=0,top="+cnTop+",left="+cnLeft);
	docCal=winCal.document;
	RenderCal();
}

function RenderCal()
{
	var vCalHeader;
	var vCalData;
	var vCalTime;
	var i;
	var j;
	var SelectStr;
	var vDayCount=0;
	var vFirstDay;

	docCal.open();
	docCal.writeln("<html><head><title>"+WindowTitle+"</title>");
	docCal.writeln("<script>var winMain=window.opener;</script>");
	docCal.writeln("</head><body background='"+ThemeBg+"' link="+FontColor+" vlink="+FontColor+"><form name='Calendar'>");

	vCalHeader="<table border=1 cellpadding=1 cellspacing=1 width='100%' align=\"center\" valign=\"top\">\n";
	
	vCalHeader+="<tr>\n<td colspan='7'><table border=0 width='100%' cellpadding=0 cellspacing=0><tr><td align='left'>\n";
	vCalHeader+="<select name=\"MonthSelector\" onChange=\"javascript:winMain.Cal.SwitchMth(this.selectedIndex);winMain.RenderCal();\">\n";
	for (i=0;i<12;i++)
	{
		if (i==Cal.Month)
			SelectStr="Selected";
		else
			SelectStr="";	
		vCalHeader+="<option "+SelectStr+" value >"+MonthName[i]+"\n";
	}
	vCalHeader+="</select></td>";
	
	vCalHeader+="\n<td align='right'><a href=\"javascript:winMain.Cal.DecYear();winMain.RenderCal()\"><b><font color=\""+YrSelColor+"\"><</font></b></a><font face=\"Verdana\" color=\""+YrSelColor+"\" size=2><b> "+Cal.Year+" </b></font><a href=\"javascript:winMain.Cal.IncYear();winMain.RenderCal()\"><b><font color=\""+YrSelColor+"\">></font></b></a></td></tr></table></td>\n";	
	vCalHeader+="</tr>";
	
	if (ShowMonthYear)
		vCalHeader+="<tr><td colspan='7'><font face='Verdana' size='2' align='center' color='"+MonthYearColor+"'><b>"+Cal.GetMonthName(ShowLongMonth)+" "+Cal.Year+"</b></font></td></tr>\n";
	
	vCalHeader+="<tr bgcolor="+WeekHeadColor+">";
	for (i=0;i<7;i++)
	{
		vCalHeader+="<td align='center'><font face='Verdana' size='2'>"+WeekDayName[i].substr(0,WeekChar)+"</font></td>";
	}
	vCalHeader+="</tr>";	
	docCal.write(vCalHeader);
	
	
	CalDate=new Date(Cal.Year,Cal.Month);
	CalDate.setDate(1);
	vFirstDay=CalDate.getDay();
	vCalData="<tr>";
	for (i=0;i<vFirstDay;i++)
	{
		vCalData=vCalData+GenCell();
		vDayCount=vDayCount+1;
	}
	for (j=1;j<=Cal.GetMonDays();j++)
	{
		var strCell;
		vDayCount=vDayCount+1;
		if ((j==dtToday.getDate())&&(Cal.Month==dtToday.getMonth())&&(Cal.Year==dtToday.getFullYear()))
			strCell=GenCell(j,true,TodayColor);//Highlight today's date
		else
		{
			if (j==Cal.Date)
			{
				strCell=GenCell(j,true,SelDateColor);
			}
			else
			{	 
				if (vDayCount%7==0)
					strCell=GenCell(j,false,SaturdayColor);
				else if ((vDayCount+6)%7==0)
					strCell=GenCell(j,false,SundayColor);
				else
					strCell=GenCell(j,null,WeekDayColor);
			}		
		}						
		vCalData=vCalData+strCell;

		if((vDayCount%7==0)&&(j<Cal.GetMonDays()))
		{
			vCalData=vCalData+"</tr>\n<tr>";
		}
	}
	docCal.writeln(vCalData);	
	
	if (Cal.ShowTime)
	{
		var showHour;
		showHour=Cal.getShowHour();		
		vCalTime="<tr>\n<td colspan='7' align='center'>";
		vCalTime+="<input type='text' name='hour' maxlength=2 size=1 style=\"WIDTH: 22px\" value="+showHour+" onchange=\"javascript:winMain.Cal.SetHour(this.value)\">";
		vCalTime+=" : ";
		vCalTime+="<input type='text' name='minute' maxlength=2 size=1 style=\"WIDTH: 22px\" value="+Cal.Minutes+" onchange=\"javascript:winMain.Cal.SetMinute(this.value)\">";
		vCalTime+=" : ";
		vCalTime+="<input type='text' name='second' maxlength=2 size=1 style=\"WIDTH: 22px\" value="+Cal.Seconds+" onchange=\"javascript:winMain.Cal.SetSecond(this.value)\">";
		if (TimeMode==12)
		{
			var SelectAm =(parseInt(Cal.Hours,10)<12)? "Selected":"";
			var SelectPm =(parseInt(Cal.Hours,10)>=12)? "Selected":"";

			vCalTime+="<select name=\"ampm\" onchange=\"javascript:winMain.Cal.SetAmPm(this.options[this.selectedIndex].value);\">";
			vCalTime+="<option "+SelectAm+" value=\"AM\">AM</option>";
			vCalTime+="<option "+SelectPm+" value=\"PM\">PM<option>";
			vCalTime+="</select>";
		}	
		vCalTime+="\n</td>\n</tr>";
		docCal.write(vCalTime);
	}	
	
	docCal.writeln("\n</table>");
	docCal.writeln("</form></body></html>");
	docCal.close();
}

function GenCell(pValue,pHighLight,pColor)//Generate table cell with value
{
	var PValue;
	var PCellStr;
	var vColor;
	var vHLstr1;
	var vHlstr2;
	var vTimeStr;
	
	if (pValue==null)
		PValue="";
	else
		PValue=pValue;
	
	if (pColor!=null)
		vColor="bgcolor=\""+pColor+"\"";
	else
		vColor="";	
	if ((pHighLight!=null)&&(pHighLight))
		{vHLstr1="color='red'><b>";vHLstr2="</b>";}
	else
		{vHLstr1=">";vHLstr2="";}	
	
	if (Cal.ShowTime)
	{
		vTimeStr="winMain.document.getElementById('"+Cal.Ctrl+"').value+=' '+"+"winMain.Cal.getShowHour()"+"+':'+"+"winMain.Cal.Minutes"+"+':'+"+"winMain.Cal.Seconds";
		if (TimeMode==12)
			vTimeStr+="+' '+winMain.Cal.AMorPM";
	}	
	else
		vTimeStr="";		
	PCellStr="<td "+vColor+" width="+CellWidth+" align='center'><font face='verdana' size='2'"+vHLstr1+"<a href=\"javascript:winMain.document.getElementById('"+Cal.Ctrl+"').value='"+Cal.FormatDate(PValue)+"';"+vTimeStr+";window.close();\">"+PValue+"</a>"+vHLstr2+"</font></td>";
	return PCellStr;
}

function Calendar(pDate,pCtrl)
{

	this.Date=pDate.getDate();
	this.Month=pDate.getMonth();
	this.Year=pDate.getFullYear();
	this.Hours=pDate.getHours();	
	
	if (pDate.getMinutes()<10)
		this.Minutes="0"+pDate.getMinutes();
	else
		this.Minutes=pDate.getMinutes();
	
	if (pDate.getSeconds()<10)
		this.Seconds="0"+pDate.getSeconds();
	else		
		this.Seconds=pDate.getSeconds();
		
	this.MyWindow=winCal;
	this.Ctrl=pCtrl;
	this.Format="ddMMyyyy";
	this.Separator=DateSeparator;
	this.ShowTime=false;
	if (pDate.getHours()<12)
		this.AMorPM="AM";
	else
		this.AMorPM="PM";	
}

function GetMonthIndex(shortMonthName)
{
	for (i=0;i<12;i++)
	{
		if (MonthName[i].substring(0,3).toUpperCase()==shortMonthName.toUpperCase())
		{	return i;}
	}
}
Calendar.prototype.GetMonthIndex=GetMonthIndex;

function IncYear()
{	Cal.Year++;}
Calendar.prototype.IncYear=IncYear;

function DecYear()
{	Cal.Year--;}
Calendar.prototype.DecYear=DecYear;
	
function SwitchMth(intMth)
{	Cal.Month=intMth;}
Calendar.prototype.SwitchMth=SwitchMth;

function SetHour(intHour)
{	
	var MaxHour;
	var MinHour;
	if (TimeMode==24)
	{	MaxHour=23;MinHour=0}
	else if (TimeMode==12)
	{	MaxHour=12;MinHour=1}
	else
		alert("TimeMode can only be 12 or 24");		
	var HourExp=new RegExp("^\\d\\d$");
	if (HourExp.test(intHour) && (parseInt(intHour,10)<=MaxHour) && (parseInt(intHour,10)>=MinHour))
	{	
		if ((TimeMode==12) && (Cal.AMorPM=="PM"))
		{
			if (parseInt(intHour,10)==12)
				Cal.Hours=12;
			else	
				Cal.Hours=parseInt(intHour,10)+12;
		}	
		else if ((TimeMode==12) && (Cal.AMorPM=="AM"))
		{
			if (intHour==12)
				intHour-=12;
			Cal.Hours=parseInt(intHour,10);
		}
		else if (TimeMode==24)
			Cal.Hours=parseInt(intHour,10);	
	}
}
Calendar.prototype.SetHour=SetHour;

function SetMinute(intMin)
{
	var MinExp=new RegExp("^\\d\\d$");
	if (MinExp.test(intMin) && (intMin<60))
		Cal.Minutes=intMin;
}
Calendar.prototype.SetMinute=SetMinute;

function SetSecond(intSec)
{	
	var SecExp=new RegExp("^\\d\\d$");
	if (SecExp.test(intSec) && (intSec<60))
		Cal.Seconds=intSec;
}
Calendar.prototype.SetSecond=SetSecond;

function SetAmPm(pvalue)
{
	this.AMorPM=pvalue;
	if (pvalue=="PM")
	{
		this.Hours=(parseInt(this.Hours,10))+12;
		if (this.Hours==24)
			this.Hours=12;
	}	
	else if (pvalue=="AM")
		this.Hours-=12;	
}
Calendar.prototype.SetAmPm=SetAmPm;

function getShowHour()
{
	var finalHour;
    if (TimeMode==12)
    {
    	if (parseInt(this.Hours,10)==0)
		{
			this.AMorPM="AM";
			finalHour=parseInt(this.Hours,10)+12;	
		}
		else if (parseInt(this.Hours,10)==12)
		{
			this.AMorPM="PM";
			finalHour=12;
		}		
		else if (this.Hours>12)
		{
			this.AMorPM="PM";
			if ((this.Hours-12)<10)
				finalHour="0"+((parseInt(this.Hours,10))-12);
			else
				finalHour=parseInt(this.Hours,10)-12;	
		}
		else
		{
			this.AMorPM="AM";
			if (this.Hours<10)
				finalHour="0"+parseInt(this.Hours,10);
			else
				finalHour=this.Hours;	
		}
	}
	else if (TimeMode==24)
	{
		if (this.Hours<10)
			finalHour="0"+parseInt(this.Hours,10);
		else	
			finalHour=this.Hours;
	}	
	return finalHour;	
}				
Calendar.prototype.getShowHour=getShowHour;		

function GetMonthName(IsLong)
{
	var Month=MonthName[this.Month];
	if (IsLong)
		return Month;
	else
		return Month.substr(0,3);
}
Calendar.prototype.GetMonthName=GetMonthName;

function GetMonDays()
{
	var DaysInMonth=[31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
	if (this.IsLeapYear())
	{
		DaysInMonth[1]=29;
	}	
	return DaysInMonth[this.Month];	
}
Calendar.prototype.GetMonDays=GetMonDays;

function IsLeapYear()
{
	if ((this.Year%4)==0)
	{
		if ((this.Year%100==0) && (this.Year%400)!=0)
		{
			return false;
		}
		else
		{
			return true;
		}
	}
	else
	{
		return false;
	}
}
Calendar.prototype.IsLeapYear=IsLeapYear;

function FormatDate(pDate)
{
	if (this.Format.toUpperCase()=="DDMMYYYY")
		return (pDate+DateSeparator+(this.Month+1)+DateSeparator+this.Year);
	else if (this.Format.toUpperCase()=="DDMMMYYYY")
		return (pDate+DateSeparator+this.GetMonthName(false)+DateSeparator+this.Year);
	else if (this.Format.toUpperCase()=="MMDDYYYY")
		return ((this.Month+1)+DateSeparator+pDate+DateSeparator+this.Year);
	else if (this.Format.toUpperCase()=="MMMDDYYYY")
		return (this.GetMonthName(false)+DateSeparator+pDate+DateSeparator+this.Year);			
}
Calendar.prototype.FormatDate=FormatDate;	
//valiate

function validateEnquiry(form)
{
if(form.accno.checked==false)
{
document.getElementById("message").innerHTML="select Account number";
return false;
}
if(form.startDate.value=="dd-mmm-yyyy")
{
document.getElementById("message").innerHTML="select start date";
return false;
}
if(form.endDate.value=="dd-mmm-yyyy")
{
document.getElementById("message").innerHTML="select end date";
return false;
}
var date=form.startDate.value;
var date1=form.endDate.value;
var mySplitResult = date.split("/");
var day1=mySplitResult[0];
var month1=mySplitResult[1];
var year1=mySplitResult[2];
var mySplitResult1 = date1.split("/");
var day2=mySplitResult1[0];
var month2=mySplitResult1[1];
var year2=mySplitResult1[2];
switch(month1)
{
case "Jan":
         month1="01";
         break;
case "Feb":
         month1="02";
         break;
case "Mar":
         month1="03";
         break;
case "Apr":
         month1="04";
         break;
case "May":
         month1="05";
         break;
case "Jun":
         month1="06";
         break;
case "Jul":
         month1="07";
         break;
case "Aug":
         month1="08";
         break;
case "Sep":
         month1="09";
         break;
case "Oct":
         month1="10";
         break;
case "Nov":
         month1="11";
         break;
case "Dec":
         month1="12";
         break;         

}
switch(month2)
{
case "Jan":
         month="01";
         break;
case "Feb":
         month2="02";
         break;
case "Mar":
         month2="03";
         break;
case "Apr":
         month2="04";
         break;
case "May":
         month2="05";
         break;
case "Jun":
         month2="06";
         break;
case "Jul":
         month2="07";
         break;
case "Aug":
         month2="08";
         break;
case "Sep":
         month2="09";
         break;
case "Oct":
         month2="10";
         break;
case "Nov":
         month2="11";
         break;
case "Dec":
         month2="12";
         break;         

}
date1=year1+"-"+month1+"-"+day1;
date2=year2+"-"+month2+"-"+day2;
form.startDate.value=date1;
form.endDate.value=date2;
return true;
}
