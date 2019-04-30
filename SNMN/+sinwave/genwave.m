function [soundm,tmpstruct] = genwave(strct,bdura,fs,tempstruct)
%genwave - 给定该音的各项参数等生成对应音频数据
%
%    [soundm,tempstruct] = genwave(strct,bdura,fs,tempstruct)
%
%    strct
%        包含该音各项信息的struct
%
%    bdura
%        每一拍实际时长
%
%    fs
%        每秒采样数
%
%    tempstruct
%        储存临时数据的结构体。在本函数中实际用不上。
%
%    返回：
%
%    soundm
%        声音数据的单行矩阵
%
%    tmpstruct
%        储存临时数据的结构体。

  x=linspace(0,2*pi*strct.dura*bdura,fs*strct.dura*bdura);
  soundm=sin(sinwave.freq(strct.note,strct.lh,strct.half)*x);
  tmpstruct=tempstruct;
    
end