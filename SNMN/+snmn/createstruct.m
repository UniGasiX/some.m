function strct = createstruct(note,lh,half,dura)
%createstruct - 根据给定的该音的信息构建指定格式表示单个音的struct
%
%    strct = createstruct(note,lh,half,dura)
%
%    note
%        音高符号，以数字而非字符形式指定。
%
%    lh
%        指示相对C调降低或升高几个7个音。升高为正，降低为负，不变为0。
%
%    half
%        指示升或降半个音。升为1，将为-1，不升降为0。
%
%    dura
%        该音的拍数。
%
%    返回指定格式表示该音各信息的struct。
    
  strct=struct('note',note,'lh',lh,'half',half,'dura',dura);

end