
class msgType{
  String msgtype  ='0';// 0- Normal list,1- a-z,2- Colors
  List<String> range=[''];

msgType(String msgType,List<String> range){
  msgtype=msgType;
  range=range;
  if(msgType=="1")
  {
    this.range=['A','B','C','D','E','F','G','H','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
  }
  if(msgType=="2")
    {
      this.range=['Red' ,'Orange', 'Yellow', 'Green', 'Cyan', 'Blue' ,'Purple', 'pink', 'Magneta', 'White'];


    }




}
}
