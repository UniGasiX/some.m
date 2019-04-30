function structs = str2structs(str)
%str2structs - 将给定字符串作为SNMN格式文本进行解析，并返回顺序表示各音信息的struct。
%
%    structs = str2structs(str)
%
%    str
%        给定的snmn格式字符串。
%
%    返回顺序表示各音信息的struct。

  structs=[];
  aft=0; % prefix:1,suffix:2,note:3
  note=0;
  lorh=0; % ...,-1,0,1,...
  half=0;
  dura=1;
  doendcreate=1;
  for c=str

    if(strcmp(c,"0"))
      checkpre_note();
      aft=3;note=0;
    elseif(strcmp(c,"1"))
      checkpre_note();
      aft=3;note=1;
    elseif(strcmp(c,"2"))
      checkpre_note();
      aft=3;note=2;
    elseif(strcmp(c,"3"))
      checkpre_note();
      aft=3;note=3;
    elseif(strcmp(c,"4"))
      checkpre_note();
      aft=3;note=4;
    elseif(strcmp(c,"5"))
      checkpre_note();
      aft=3;note=5;
    elseif(strcmp(c,"6"))
      checkpre_note();
      aft=3;note=6;
    elseif(strcmp(c,"7"))
      checkpre_note();
      aft=3;note=7;
    elseif(strcmp(c,"-"))
      checkpre_pfx();
      aft=1;lorh=lorh-1;
    elseif(strcmp(c,"+"))
      checkpre_pfx();
      aft=1;lorh=lorh+1;
    elseif(strcmp(c,"#"))
      checkpre_pfx();
      aft=1;lorh=lorh+1;
    elseif(strcmp(c,"b"))
      checkpre_pfx();
      aft=1;lorh=lorh+1;
    elseif(strcmp(c,"~"))
      checkpre_sfx();
      aft=2;dura=dura+1;
    elseif(strcmp(c,"_"))
      checkpre_sfx();
      aft=2;dura=dura/2;
    elseif(strcmp(c,"."))
      checkpre_sfx();
      aft=2;dura=dura*1.5;
    elseif(strcmp(c,"%"))
      checkpre_end();
      break;
    end
  
  end

  if(doendcreate)
    create();
  end
  
  function checkpre_pfx
    if(aft==2)
      create();
    elseif(aft==3)
      create();
    end
  end
  
  function checkpre_sfx
    if(aft==1)
      error("you set a suffix after a prefix");
    end
  end
  
  function checkpre_note
    if(aft==2)
      create();
    elseif(aft==3)
      create();
    end
  end

  function checkpre_end
    if(aft==1)
      doendcreate=0;
    end
  end
  
  function create
    structs=[structs,snmn.createstruct(note,lorh,half,dura)];
    note=0; lorh=0; half=0; dura=1;
  end

end