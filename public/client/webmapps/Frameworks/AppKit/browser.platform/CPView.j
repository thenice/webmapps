I;20;Foundation/CPArray.jI;26;Foundation/CPObjJRuntime.ji;19;CGAffineTransform.ji;12;CGGeometry.ji;9;CPColor.ji;20;CPDOMDisplayServer.ji;12;CPGeometry.ji;19;CPGraphicsContext.ji;13;CPResponder.ji;9;CPTheme.jc;67823;
CPViewNotSizable=0;
CPViewMinXMargin=1;
CPViewWidthSizable=2;
CPViewMaxXMargin=4;
CPViewMinYMargin=8;
CPViewHeightSizable=16;
CPViewMaxYMargin=32;
CPViewBoundsDidChangeNotification="CPViewBoundsDidChangeNotification";
CPViewFrameDidChangeNotification="CPViewFrameDidChangeNotification";
var _1=nil,_2=nil;
var _3=nil,_4=0,_5=1,_6=2,_7=3;
var _8={},_9=1<<0,_a=1<<1;
var _b=objj_allocateClassPair(CPResponder,"CPView"),_c=_b.isa;
class_addIvars(_b,[new objj_ivar("_window"),new objj_ivar("_superview"),new objj_ivar("_subviews"),new objj_ivar("_graphicsContext"),new objj_ivar("_tag"),new objj_ivar("_frame"),new objj_ivar("_bounds"),new objj_ivar("_boundsTransform"),new objj_ivar("_inverseBoundsTransform"),new objj_ivar("_registeredDraggedTypes"),new objj_ivar("_registeredDraggedTypesArray"),new objj_ivar("_isHidden"),new objj_ivar("_hitTests"),new objj_ivar("_postsFrameChangedNotifications"),new objj_ivar("_postsBoundsChangedNotifications"),new objj_ivar("_inhibitFrameAndBoundsChangedNotifications"),new objj_ivar("_DOMElement"),new objj_ivar("_DOMContentsElement"),new objj_ivar("_DOMImageParts"),new objj_ivar("_DOMImageSizes"),new objj_ivar("_backgroundType"),new objj_ivar("_dirtyRect"),new objj_ivar("_opacity"),new objj_ivar("_backgroundColor"),new objj_ivar("_autoresizesSubviews"),new objj_ivar("_autoresizingMask"),new objj_ivar("_layer"),new objj_ivar("_wantsLayer"),new objj_ivar("_isInFullScreenMode"),new objj_ivar("_fullScreenModeState"),new objj_ivar("_needsLayout"),new objj_ivar("_ephemeralSubviews"),new objj_ivar("_theme"),new objj_ivar("_themeAttributes"),new objj_ivar("_themeState"),new objj_ivar("_ephemeralSubviewsForNames"),new objj_ivar("_ephereralSubviews"),new objj_ivar("_nextKeyView"),new objj_ivar("_previousKeyView"),new objj_ivar("_viewClassFlags")]);
objj_registerClassPair(_b);
objj_addClassForBundle(_b,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_b,[new objj_method(sel_getUid("setupViewFlags"),function(_d,_e){
with(_d){
var _f=objj_msgSend(_d,"class"),_10=objj_msgSend(_f,"UID");
if(_8[_10]===undefined){
var _11=0;
if(objj_msgSend(_f,"instanceMethodForSelector:",sel_getUid("drawRect:"))!==objj_msgSend(CPView,"instanceMethodForSelector:",sel_getUid("drawRect:"))){
_11|=_9;
}
if(objj_msgSend(_f,"instanceMethodForSelector:",sel_getUid("layoutSubviews"))!==objj_msgSend(CPView,"instanceMethodForSelector:",sel_getUid("layoutSubviews"))){
_11|=_a;
}
_8[_10]=_11;
}
_viewClassFlags=_8[_10];
}
}),new objj_method(sel_getUid("init"),function(_12,_13){
with(_12){
return objj_msgSend(_12,"initWithFrame:",CGRectMakeZero());
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_14,_15,_16){
with(_14){
_14=objj_msgSendSuper({receiver:_14,super_class:objj_getClass("CPResponder")},"init");
if(_14){
var _17=(_16.size.width),_18=(_16.size.height);
_subviews=[];
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
_tag=-1;
_frame={origin:{x:_16.origin.x,y:_16.origin.y},size:{width:_16.size.width,height:_16.size.height}};
_bounds={origin:{x:0,y:0},size:{width:_17,height:_18}};
_autoresizingMask=CPViewNotSizable;
_autoresizesSubviews=YES;
_opacity=1;
_isHidden=NO;
_hitTests=YES;
_DOMElement=_3.cloneNode(false);
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _19=_DOMElement.CPDOMDisplayContext[0];
if(!(_19>=0)){
_19=_DOMElement.CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_19]=0;
CPDOMDisplayServerInstructions[_19+1]=_DOMElement;
CPDOMDisplayServerInstructions[_19+2]=NULL;
CPDOMDisplayServerInstructions[_19+3]=(_16.origin.x);
CPDOMDisplayServerInstructions[_19+4]=(_16.origin.y);
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _19=_DOMElement.CPDOMDisplayContext[4];
if(!(_19>=0)){
_19=_DOMElement.CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_19]=4;
CPDOMDisplayServerInstructions[_19+1]=_DOMElement;
CPDOMDisplayServerInstructions[_19+2]=_17;
CPDOMDisplayServerInstructions[_19+3]=_18;
_DOMImageParts=[];
_DOMImageSizes=[];
_theme=objj_msgSend(CPTheme,"defaultTheme");
_themeState=CPThemeStateNormal;
objj_msgSend(_14,"setupViewFlags");
objj_msgSend(_14,"_loadThemeAttributes");
}
return _14;
}
}),new objj_method(sel_getUid("superview"),function(_1a,_1b){
with(_1a){
return _superview;
}
}),new objj_method(sel_getUid("subviews"),function(_1c,_1d){
with(_1c){
return _subviews;
}
}),new objj_method(sel_getUid("window"),function(_1e,_1f){
with(_1e){
return _window;
}
}),new objj_method(sel_getUid("addSubview:"),function(_20,_21,_22){
with(_20){
objj_msgSend(_20,"_insertSubview:atIndex:",_22,CPNotFound);
}
}),new objj_method(sel_getUid("addSubview:positioned:relativeTo:"),function(_23,_24,_25,_26,_27){
with(_23){
var _28=_27?objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_27):CPNotFound;
if(_28===CPNotFound){
_28=(_26===CPWindowAbove)?objj_msgSend(_subviews,"count"):0;
}else{
if(_26===CPWindowAbove){
++_28;
}
}
objj_msgSend(_23,"_insertSubview:atIndex:",_25,_28);
}
}),new objj_method(sel_getUid("_insertSubview:atIndex:"),function(_29,_2a,_2b,_2c){
with(_29){
var _2d=_subviews.length;
objj_msgSend(objj_msgSend(_29,"window"),"_dirtyKeyViewLoop");
if(_2b._superview==_29){
var _2e=objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_2b);
if(_2e===_2c||_2e===_2d-1&&_2c===_2d){
return;
}
objj_msgSend(_subviews,"removeObjectAtIndex:",_2e);
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=8;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_2b._DOMElement;
if(_2c>_2e){
--_2c;
}
--_2d;
}else{
objj_msgSend(_2b,"removeFromSuperview");
objj_msgSend(_2b,"_setWindow:",_window);
objj_msgSend(_2b,"viewWillMoveToSuperview:",_29);
_2b._superview=_29;
}
if(_2c===CPNotFound||_2c>=_2d){
_subviews.push(_2b);
if(_2b._DOMElement.CPDOMDisplayContext){
_2b._DOMElement.CPDOMDisplayContext[0]=-1;
}
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=6;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_2b._DOMElement;
}else{
_subviews.splice(_2c,0,_2b);
if(_2b._DOMElement.CPDOMDisplayContext){
_2b._DOMElement.CPDOMDisplayContext[0]=-1;
}
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=7;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_2b._DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_subviews[_2c+1]._DOMElement;
}
objj_msgSend(_2b,"setNextResponder:",_29);
objj_msgSend(_2b,"viewDidMoveToSuperview");
objj_msgSend(_29,"didAddSubview:",_2b);
}
}),new objj_method(sel_getUid("didAddSubview:"),function(_2f,_30,_31){
with(_2f){
}
}),new objj_method(sel_getUid("removeFromSuperview"),function(_32,_33){
with(_32){
if(!_superview){
return;
}
objj_msgSend(objj_msgSend(_32,"window"),"_dirtyKeyViewLoop");
objj_msgSend(_superview,"willRemoveSubview:",_32);
objj_msgSend(objj_msgSend(_superview,"subviews"),"removeObject:",_32);
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=8;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_superview._DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
_superview=nil;
objj_msgSend(_32,"_setWindow:",nil);
}
}),new objj_method(sel_getUid("replaceSubview:with:"),function(_34,_35,_36,_37){
with(_34){
if(_36._superview!=_34){
return;
}
var _38=objj_msgSend(_subviews,"indexOfObjectIdenticalTo:",_36);
objj_msgSend(_36,"removeFromSuperview");
objj_msgSend(_34,"_insertSubview:atIndex:",_37,_38);
}
}),new objj_method(sel_getUid("_setWindow:"),function(_39,_3a,_3b){
with(_39){
if(_window===_3b){
return;
}
objj_msgSend(objj_msgSend(_39,"window"),"_dirtyKeyViewLoop");
if(objj_msgSend(_window,"firstResponder")===_39){
objj_msgSend(_window,"makeFirstResponder:",nil);
}
objj_msgSend(_39,"viewWillMoveToWindow:",_3b);
if(_registeredDraggedTypes){
objj_msgSend(_window,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_3b,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
}
_window=_3b;
var _3c=objj_msgSend(_subviews,"count");
while(_3c--){
objj_msgSend(_subviews[_3c],"_setWindow:",_3b);
}
objj_msgSend(_39,"viewDidMoveToWindow");
objj_msgSend(objj_msgSend(_39,"window"),"_dirtyKeyViewLoop");
}
}),new objj_method(sel_getUid("isDescendantOf:"),function(_3d,_3e,_3f){
with(_3d){
var _40=_3d;
do{
if(_40==_3f){
return YES;
}
}while(_40=objj_msgSend(_40,"superview"));
return NO;
}
}),new objj_method(sel_getUid("viewDidMoveToSuperview"),function(_41,_42){
with(_41){
objj_msgSend(_41,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("viewDidMoveToWindow"),function(_43,_44){
with(_43){
}
}),new objj_method(sel_getUid("viewWillMoveToSuperview:"),function(_45,_46,_47){
with(_45){
}
}),new objj_method(sel_getUid("viewWillMoveToWindow:"),function(_48,_49,_4a){
with(_48){
}
}),new objj_method(sel_getUid("willRemoveSubview:"),function(_4b,_4c,_4d){
with(_4b){
}
}),new objj_method(sel_getUid("enclosingMenuItem"),function(_4e,_4f){
with(_4e){
var _50=_4e;
while(_50&&!objj_msgSend(_50,"isKindOfClass:",objj_msgSend(_CPMenuItemView,"class"))){
_50=objj_msgSend(_50,"superview");
}
if(_50){
return _50._menuItem;
}
return nil;
}
}),new objj_method(sel_getUid("setTag:"),function(_51,_52,_53){
with(_51){
_tag=_53;
}
}),new objj_method(sel_getUid("tag"),function(_54,_55){
with(_54){
return _tag;
}
}),new objj_method(sel_getUid("viewWithTag:"),function(_56,_57,_58){
with(_56){
if(objj_msgSend(_56,"tag")===_58){
return _56;
}
var _59=0,_5a=_subviews.length;
for(;_59<_5a;++_59){
var _5b=objj_msgSend(_subviews[_59],"viewWithTag:",_58);
if(_5b){
return _5b;
}
}
return nil;
}
}),new objj_method(sel_getUid("isFlipped"),function(_5c,_5d){
with(_5c){
return YES;
}
}),new objj_method(sel_getUid("setFrame:"),function(_5e,_5f,_60){
with(_5e){
if(((_frame.origin.x==_60.origin.x&&_frame.origin.y==_60.origin.y)&&(_frame.size.width==_60.size.width&&_frame.size.height==_60.size.height))){
return;
}
_inhibitFrameAndBoundsChangedNotifications=YES;
objj_msgSend(_5e,"setFrameOrigin:",_60.origin);
objj_msgSend(_5e,"setFrameSize:",_60.size);
_inhibitFrameAndBoundsChangedNotifications=NO;
if(_postsFrameChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_5e);
}
}
}),new objj_method(sel_getUid("frame"),function(_61,_62){
with(_61){
return {origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}};
}
}),new objj_method(sel_getUid("frameOrigin"),function(_63,_64){
with(_63){
return {x:_frame.origin.x,y:_frame.origin.y};
}
}),new objj_method(sel_getUid("frameSize"),function(_65,_66){
with(_65){
return {width:_frame.size.width,height:_frame.size.height};
}
}),new objj_method(sel_getUid("setCenter:"),function(_67,_68,_69){
with(_67){
objj_msgSend(_67,"setFrameOrigin:",CGPointMake(_69.x-_frame.size.width/2,_69.y-_frame.size.height/2));
}
}),new objj_method(sel_getUid("center"),function(_6a,_6b){
with(_6a){
return CGPointMake(_frame.size.width/2+_frame.origin.x,_frame.size.height/2+_frame.origin.y);
}
}),new objj_method(sel_getUid("setFrameOrigin:"),function(_6c,_6d,_6e){
with(_6c){
var _6f=_frame.origin;
if(!_6e||(_6f.x==_6e.x&&_6f.y==_6e.y)){
return;
}
_6f.x=_6e.x;
_6f.y=_6e.y;
if(_postsFrameChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_6c);
}
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _70=_DOMElement.CPDOMDisplayContext[0];
if(!(_70>=0)){
_70=_DOMElement.CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_70]=0;
CPDOMDisplayServerInstructions[_70+1]=_DOMElement;
CPDOMDisplayServerInstructions[_70+2]=_superview?_superview._boundsTransform:NULL;
CPDOMDisplayServerInstructions[_70+3]=_6f.x;
CPDOMDisplayServerInstructions[_70+4]=_6f.y;
}
}),new objj_method(sel_getUid("setFrameSize:"),function(_71,_72,_73){
with(_71){
var _74=_frame.size;
if(!_73||(_74.width==_73.width&&_74.height==_73.height)){
return;
}
var _75={width:_74.width,height:_74.height};
_74.width=_73.width;
_74.height=_73.height;
if(YES){
_bounds.size.width=_73.width;
_bounds.size.height=_73.height;
}
if(_layer){
objj_msgSend(_layer,"_owningViewBoundsChanged");
}
if(_autoresizesSubviews){
objj_msgSend(_71,"resizeSubviewsWithOldSize:",_75);
}
objj_msgSend(_71,"setNeedsLayout");
objj_msgSend(_71,"setNeedsDisplay:",YES);
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _76=_DOMElement.CPDOMDisplayContext[4];
if(!(_76>=0)){
_76=_DOMElement.CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_76]=4;
CPDOMDisplayServerInstructions[_76+1]=_DOMElement;
CPDOMDisplayServerInstructions[_76+2]=_74.width;
CPDOMDisplayServerInstructions[_76+3]=_74.height;
if(_DOMContentsElement){
if(!_DOMContentsElement.CPDOMDisplayContext){
_DOMContentsElement.CPDOMDisplayContext=[];
}
var _76=_DOMContentsElement.CPDOMDisplayContext[5];
if(!(_76>=0)){
_76=_DOMContentsElement.CPDOMDisplayContext[5]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_76]=5;
CPDOMDisplayServerInstructions[_76+1]=_DOMContentsElement;
CPDOMDisplayServerInstructions[_76+2]=_74.width;
CPDOMDisplayServerInstructions[_76+3]=_74.height;
if(!_DOMContentsElement.CPDOMDisplayContext){
_DOMContentsElement.CPDOMDisplayContext=[];
}
var _76=_DOMContentsElement.CPDOMDisplayContext[4];
if(!(_76>=0)){
_76=_DOMContentsElement.CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_76]=4;
CPDOMDisplayServerInstructions[_76+1]=_DOMContentsElement;
CPDOMDisplayServerInstructions[_76+2]=_74.width;
CPDOMDisplayServerInstructions[_76+3]=_74.height;
}
if(_backgroundType!==_4){
var _77=objj_msgSend(objj_msgSend(_backgroundColor,"patternImage"),"imageSlices");
if(_backgroundType===_5){
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _76=_DOMImageParts[1].CPDOMDisplayContext[4];
if(!(_76>=0)){
_76=_DOMImageParts[1].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_76]=4;
CPDOMDisplayServerInstructions[_76+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_76+2]=_74.width;
CPDOMDisplayServerInstructions[_76+3]=_74.height-_DOMImageSizes[0].height-_DOMImageSizes[2].height;
}else{
if(_backgroundType===_6){
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _76=_DOMImageParts[1].CPDOMDisplayContext[4];
if(!(_76>=0)){
_76=_DOMImageParts[1].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_76]=4;
CPDOMDisplayServerInstructions[_76+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_76+2]=_74.width-_DOMImageSizes[0].width-_DOMImageSizes[2].width;
CPDOMDisplayServerInstructions[_76+3]=_74.height;
}else{
if(_backgroundType===_7){
var _78=_74.width-_DOMImageSizes[0].width-_DOMImageSizes[2].width,_79=_74.height-_DOMImageSizes[0].height-_DOMImageSizes[6].height;
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _76=_DOMImageParts[1].CPDOMDisplayContext[4];
if(!(_76>=0)){
_76=_DOMImageParts[1].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_76]=4;
CPDOMDisplayServerInstructions[_76+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_76+2]=_78;
CPDOMDisplayServerInstructions[_76+3]=_DOMImageSizes[0].height;
if(!_DOMImageParts[3].CPDOMDisplayContext){
_DOMImageParts[3].CPDOMDisplayContext=[];
}
var _76=_DOMImageParts[3].CPDOMDisplayContext[4];
if(!(_76>=0)){
_76=_DOMImageParts[3].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_76]=4;
CPDOMDisplayServerInstructions[_76+1]=_DOMImageParts[3];
CPDOMDisplayServerInstructions[_76+2]=_DOMImageSizes[3].width;
CPDOMDisplayServerInstructions[_76+3]=_79;
if(!_DOMImageParts[4].CPDOMDisplayContext){
_DOMImageParts[4].CPDOMDisplayContext=[];
}
var _76=_DOMImageParts[4].CPDOMDisplayContext[4];
if(!(_76>=0)){
_76=_DOMImageParts[4].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_76]=4;
CPDOMDisplayServerInstructions[_76+1]=_DOMImageParts[4];
CPDOMDisplayServerInstructions[_76+2]=_78;
CPDOMDisplayServerInstructions[_76+3]=_79;
if(!_DOMImageParts[5].CPDOMDisplayContext){
_DOMImageParts[5].CPDOMDisplayContext=[];
}
var _76=_DOMImageParts[5].CPDOMDisplayContext[4];
if(!(_76>=0)){
_76=_DOMImageParts[5].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_76]=4;
CPDOMDisplayServerInstructions[_76+1]=_DOMImageParts[5];
CPDOMDisplayServerInstructions[_76+2]=_DOMImageSizes[5].width;
CPDOMDisplayServerInstructions[_76+3]=_79;
if(!_DOMImageParts[7].CPDOMDisplayContext){
_DOMImageParts[7].CPDOMDisplayContext=[];
}
var _76=_DOMImageParts[7].CPDOMDisplayContext[4];
if(!(_76>=0)){
_76=_DOMImageParts[7].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_76]=4;
CPDOMDisplayServerInstructions[_76+1]=_DOMImageParts[7];
CPDOMDisplayServerInstructions[_76+2]=_78;
CPDOMDisplayServerInstructions[_76+3]=_DOMImageSizes[7].height;
}
}
}
}
if(_postsFrameChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_71);
}
}
}),new objj_method(sel_getUid("setBounds:"),function(_7a,_7b,_7c){
with(_7a){
if(((_bounds.origin.x==_7c.origin.x&&_bounds.origin.y==_7c.origin.y)&&(_bounds.size.width==_7c.size.width&&_bounds.size.height==_7c.size.height))){
return;
}
_inhibitFrameAndBoundsChangedNotifications=YES;
objj_msgSend(_7a,"setBoundsOrigin:",_7c.origin);
objj_msgSend(_7a,"setBoundsSize:",_7c.size);
_inhibitFrameAndBoundsChangedNotifications=NO;
if(_postsBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_7a);
}
}
}),new objj_method(sel_getUid("bounds"),function(_7d,_7e){
with(_7d){
return {origin:{x:_bounds.origin.x,y:_bounds.origin.y},size:{width:_bounds.size.width,height:_bounds.size.height}};
}
}),new objj_method(sel_getUid("setBoundsOrigin:"),function(_7f,_80,_81){
with(_7f){
var _82=_bounds.origin;
if((_82.x==_81.x&&_82.y==_81.y)){
return;
}
_82.x=_81.x;
_82.y=_81.y;
if(_82.x!=0||_82.y!=0){
_boundsTransform={a:1,b:0,c:0,d:1,tx:-_82.x,ty:-_82.y};
_inverseBoundsTransform=CGAffineTransformInvert(_boundsTransform);
}else{
_boundsTransform=nil;
_inverseBoundsTransform=nil;
}
var _83=_subviews.length;
while(_83--){
var _84=_subviews[_83],_82=_84._frame.origin;
if(!_84._DOMElement.CPDOMDisplayContext){
_84._DOMElement.CPDOMDisplayContext=[];
}
var _85=_84._DOMElement.CPDOMDisplayContext[0];
if(!(_85>=0)){
_85=_84._DOMElement.CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_85]=0;
CPDOMDisplayServerInstructions[_85+1]=_84._DOMElement;
CPDOMDisplayServerInstructions[_85+2]=_boundsTransform;
CPDOMDisplayServerInstructions[_85+3]=_82.x;
CPDOMDisplayServerInstructions[_85+4]=_82.y;
}
if(_postsBoundsChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_7f);
}
}
}),new objj_method(sel_getUid("setBoundsSize:"),function(_86,_87,_88){
with(_86){
var _89=_bounds.size;
if((_89.width==_88.width&&_89.height==_88.height)){
return;
}
var _8a=_frame.size;
if(!(_89.width==_8a.width&&_89.height==_8a.height)){
var _8b=_bounds.origin;
_8b.x/=_89.width/_8a.width;
_8b.y/=_89.height/_8a.height;
}
_89.width=_88.width;
_89.height=_88.height;
if(!(_89.width==_8a.width&&_89.height==_8a.height)){
var _8b=_bounds.origin;
_8b.x*=_89.width/_8a.width;
_8b.y*=_89.height/_8a.height;
}
if(_postsBoundsChangedNotifications&&!_inhibitFrameAndBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,_86);
}
}
}),new objj_method(sel_getUid("resizeWithOldSuperviewSize:"),function(_8c,_8d,_8e){
with(_8c){
var _8f=objj_msgSend(_8c,"autoresizingMask");
if(_8f==CPViewNotSizable){
return;
}
var _90=_superview._frame,_91={origin:{x:_frame.origin.x,y:_frame.origin.y},size:{width:_frame.size.width,height:_frame.size.height}},dX=((_90.size.width)-_8e.width)/(((_8f&CPViewMinXMargin)?1:0)+(_8f&CPViewWidthSizable?1:0)+(_8f&CPViewMaxXMargin?1:0)),dY=((_90.size.height)-_8e.height)/((_8f&CPViewMinYMargin?1:0)+(_8f&CPViewHeightSizable?1:0)+(_8f&CPViewMaxYMargin?1:0));
if(_8f&CPViewMinXMargin){
_91.origin.x+=dX;
}
if(_8f&CPViewWidthSizable){
_91.size.width+=dX;
}
if(_8f&CPViewMinYMargin){
_91.origin.y+=dY;
}
if(_8f&CPViewHeightSizable){
_91.size.height+=dY;
}
objj_msgSend(_8c,"setFrame:",_91);
}
}),new objj_method(sel_getUid("resizeSubviewsWithOldSize:"),function(_94,_95,_96){
with(_94){
var _97=_subviews.length;
while(_97--){
objj_msgSend(_subviews[_97],"resizeWithOldSuperviewSize:",_96);
}
}
}),new objj_method(sel_getUid("setAutoresizesSubviews:"),function(_98,_99,_9a){
with(_98){
_autoresizesSubviews=!!_9a;
}
}),new objj_method(sel_getUid("autoresizesSubviews"),function(_9b,_9c){
with(_9b){
return _autoresizesSubviews;
}
}),new objj_method(sel_getUid("setAutoresizingMask:"),function(_9d,_9e,_9f){
with(_9d){
_autoresizingMask=_9f;
}
}),new objj_method(sel_getUid("autoresizingMask"),function(_a0,_a1){
with(_a0){
return _autoresizingMask;
}
}),new objj_method(sel_getUid("enterFullScreenMode"),function(_a2,_a3){
with(_a2){
return objj_msgSend(_a2,"enterFullScreenMode:withOptions:",nil,nil);
}
}),new objj_method(sel_getUid("enterFullScreenMode:withOptions:"),function(_a4,_a5,_a6,_a7){
with(_a4){
_fullScreenModeState=_a8(_a4);
var _a9=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",objj_msgSend(objj_msgSend(CPPlatformWindow,"primaryPlatformWindow"),"contentBounds"),CPBorderlessWindowMask);
objj_msgSend(_a9,"setLevel:",CPScreenSaverWindowLevel);
objj_msgSend(_a9,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
var _aa=objj_msgSend(_a9,"contentView");
objj_msgSend(_aa,"setBackgroundColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_aa,"addSubview:",_a4);
objj_msgSend(_a4,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_a4,"setFrame:",CGRectMakeCopy(objj_msgSend(_aa,"bounds")));
objj_msgSend(_a9,"makeKeyAndOrderFront:",_a4);
objj_msgSend(_a9,"makeFirstResponder:",_a4);
_isInFullScreenMode=YES;
return YES;
}
}),new objj_method(sel_getUid("exitFullScreenMode"),function(_ab,_ac){
with(_ab){
objj_msgSend(_ab,"exitFullScreenModeWithOptions:",nil);
}
}),new objj_method(sel_getUid("exitFullScreenModeWithOptions:"),function(_ad,_ae,_af){
with(_ad){
if(!_isInFullScreenMode){
return;
}
_isInFullScreenMode=NO;
objj_msgSend(_ad,"setFrame:",_fullScreenModeState.frame);
objj_msgSend(_ad,"setAutoresizingMask:",_fullScreenModeState.autoresizingMask);
objj_msgSend(_fullScreenModeState.superview,"_insertSubview:atIndex:",_ad,_fullScreenModeState.index);
objj_msgSend(objj_msgSend(_ad,"window"),"orderOut:",_ad);
}
}),new objj_method(sel_getUid("isInFullScreenMode"),function(_b0,_b1){
with(_b0){
return _isInFullScreenMode;
}
}),new objj_method(sel_getUid("setHidden:"),function(_b2,_b3,_b4){
with(_b2){
_b4=!!_b4;
if(_isHidden===_b4){
return;
}
_isHidden=_b4;
_DOMElement.style.display=_isHidden?"none":"block";
if(_b4){
var _b5=objj_msgSend(_window,"firstResponder");
if(objj_msgSend(_b5,"isKindOfClass:",objj_msgSend(CPView,"class"))){
do{
if(_b2==_b5){
objj_msgSend(_window,"makeFirstResponder:",objj_msgSend(_b2,"nextValidKeyView"));
break;
}
}while(_b5=objj_msgSend(_b5,"superview"));
}
}
}
}),new objj_method(sel_getUid("isHidden"),function(_b6,_b7){
with(_b6){
return _isHidden;
}
}),new objj_method(sel_getUid("setAlphaValue:"),function(_b8,_b9,_ba){
with(_b8){
if(_opacity==_ba){
return;
}
_opacity=_ba;
if(CPFeatureIsCompatible(CPOpacityRequiresFilterFeature)){
if(_ba==1){
try{
_DOMElement.style.removeAttribute("filter");
}
catch(anException){
}
}else{
_DOMElement.style.filter="alpha(opacity="+_ba*100+")";
}
}else{
_DOMElement.style.opacity=_ba;
}
}
}),new objj_method(sel_getUid("alphaValue"),function(_bb,_bc){
with(_bb){
return _opacity;
}
}),new objj_method(sel_getUid("isHiddenOrHasHiddenAncestor"),function(_bd,_be){
with(_bd){
var _bf=_bd;
while(_bf&&!objj_msgSend(_bf,"isHidden")){
_bf=objj_msgSend(_bf,"superview");
}
return _bf!==nil;
}
}),new objj_method(sel_getUid("acceptsFirstMouse:"),function(_c0,_c1,_c2){
with(_c0){
return YES;
}
}),new objj_method(sel_getUid("hitTests"),function(_c3,_c4){
with(_c3){
return _hitTests;
}
}),new objj_method(sel_getUid("setHitTests:"),function(_c5,_c6,_c7){
with(_c5){
_hitTests=!!_c7;
}
}),new objj_method(sel_getUid("hitTest:"),function(_c8,_c9,_ca){
with(_c8){
if(_isHidden||!_hitTests||!CPRectContainsPoint(_frame,_ca)){
return nil;
}
var _cb=nil,i=_subviews.length,_cd={x:_ca.x-(_frame.origin.x),y:_ca.y-(_frame.origin.y)};
if(_inverseBoundsTransform){
_cd={x:_cd.x*_inverseBoundsTransform.a+_cd.y*_inverseBoundsTransform.c+_inverseBoundsTransform.tx,y:_cd.x*_inverseBoundsTransform.b+_cd.y*_inverseBoundsTransform.d+_inverseBoundsTransform.ty};
}
while(i--){
if(_cb=objj_msgSend(_subviews[i],"hitTest:",_cd)){
return _cb;
}
}
return _c8;
}
}),new objj_method(sel_getUid("mouseDownCanMoveWindow"),function(_ce,_cf){
with(_ce){
return !objj_msgSend(_ce,"isOpaque");
}
}),new objj_method(sel_getUid("mouseDown:"),function(_d0,_d1,_d2){
with(_d0){
if(objj_msgSend(_d0,"mouseDownCanMoveWindow")){
objj_msgSendSuper({receiver:_d0,super_class:objj_getClass("CPResponder")},"mouseDown:",_d2);
}
}
}),new objj_method(sel_getUid("setBackgroundColor:"),function(_d3,_d4,_d5){
with(_d3){
if(_backgroundColor==_d5){
return;
}
_backgroundColor=_d5;
var _d6=objj_msgSend(_backgroundColor,"patternImage"),_d7=0;
if(objj_msgSend(_d6,"isThreePartImage")){
_backgroundType=objj_msgSend(_d6,"isVertical")?_5:_6;
_d7=3-_DOMImageParts.length;
}else{
if(objj_msgSend(_d6,"isNinePartImage")){
_backgroundType=_7;
_d7=9-_DOMImageParts.length;
}else{
_backgroundType=_4;
_d7=0-_DOMImageParts.length;
}
}
if(_d7>0){
while(_d7--){
var _d8=_3.cloneNode(false);
_d8.style.zIndex=-1000;
_DOMImageParts.push(_d8);
_DOMElement.appendChild(_d8);
}
}else{
_d7=-_d7;
while(_d7--){
_DOMElement.removeChild(_DOMImageParts.pop());
}
}
if(_backgroundType==_4){
_DOMElement.style.background=_backgroundColor?objj_msgSend(_backgroundColor,"cssString"):"";
}else{
var _d9=objj_msgSend(_d6,"imageSlices"),_da=MIN(_DOMImageParts.length,_d9.length),_db=_frame.size;
while(_da--){
var _dc=_d9[_da],_dd=_DOMImageSizes[_da]=_dc?objj_msgSend(_dc,"size"):{width:0,height:0};
if(!_DOMImageParts[_da].CPDOMDisplayContext){
_DOMImageParts[_da].CPDOMDisplayContext=[];
}
var _de=_DOMImageParts[_da].CPDOMDisplayContext[4];
if(!(_de>=0)){
_de=_DOMImageParts[_da].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_de]=4;
CPDOMDisplayServerInstructions[_de+1]=_DOMImageParts[_da];
CPDOMDisplayServerInstructions[_de+2]=_dd.width;
CPDOMDisplayServerInstructions[_de+3]=_dd.height;
_DOMImageParts[_da].style.background=_dc?"url(\""+objj_msgSend(_dc,"filename")+"\")":"";
}
if(_backgroundType==_7){
var _df=_db.width-_DOMImageSizes[0].width-_DOMImageSizes[2].width,_e0=_db.height-_DOMImageSizes[0].height-_DOMImageSizes[6].height;
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _de=_DOMImageParts[1].CPDOMDisplayContext[4];
if(!(_de>=0)){
_de=_DOMImageParts[1].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_de]=4;
CPDOMDisplayServerInstructions[_de+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_de+2]=_df;
CPDOMDisplayServerInstructions[_de+3]=_DOMImageSizes[0].height;
if(!_DOMImageParts[3].CPDOMDisplayContext){
_DOMImageParts[3].CPDOMDisplayContext=[];
}
var _de=_DOMImageParts[3].CPDOMDisplayContext[4];
if(!(_de>=0)){
_de=_DOMImageParts[3].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_de]=4;
CPDOMDisplayServerInstructions[_de+1]=_DOMImageParts[3];
CPDOMDisplayServerInstructions[_de+2]=_DOMImageSizes[3].width;
CPDOMDisplayServerInstructions[_de+3]=_e0;
if(!_DOMImageParts[4].CPDOMDisplayContext){
_DOMImageParts[4].CPDOMDisplayContext=[];
}
var _de=_DOMImageParts[4].CPDOMDisplayContext[4];
if(!(_de>=0)){
_de=_DOMImageParts[4].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_de]=4;
CPDOMDisplayServerInstructions[_de+1]=_DOMImageParts[4];
CPDOMDisplayServerInstructions[_de+2]=_df;
CPDOMDisplayServerInstructions[_de+3]=_e0;
if(!_DOMImageParts[5].CPDOMDisplayContext){
_DOMImageParts[5].CPDOMDisplayContext=[];
}
var _de=_DOMImageParts[5].CPDOMDisplayContext[4];
if(!(_de>=0)){
_de=_DOMImageParts[5].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_de]=4;
CPDOMDisplayServerInstructions[_de+1]=_DOMImageParts[5];
CPDOMDisplayServerInstructions[_de+2]=_DOMImageSizes[5].width;
CPDOMDisplayServerInstructions[_de+3]=_e0;
if(!_DOMImageParts[7].CPDOMDisplayContext){
_DOMImageParts[7].CPDOMDisplayContext=[];
}
var _de=_DOMImageParts[7].CPDOMDisplayContext[4];
if(!(_de>=0)){
_de=_DOMImageParts[7].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_de]=4;
CPDOMDisplayServerInstructions[_de+1]=_DOMImageParts[7];
CPDOMDisplayServerInstructions[_de+2]=_df;
CPDOMDisplayServerInstructions[_de+3]=_DOMImageSizes[7].height;
if(!_DOMImageParts[0].CPDOMDisplayContext){
_DOMImageParts[0].CPDOMDisplayContext=[];
}
var _de=_DOMImageParts[0].CPDOMDisplayContext[0];
if(!(_de>=0)){
_de=_DOMImageParts[0].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_de]=0;
CPDOMDisplayServerInstructions[_de+1]=_DOMImageParts[0];
CPDOMDisplayServerInstructions[_de+2]=NULL;
CPDOMDisplayServerInstructions[_de+3]=0;
CPDOMDisplayServerInstructions[_de+4]=0;
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _de=_DOMImageParts[1].CPDOMDisplayContext[0];
if(!(_de>=0)){
_de=_DOMImageParts[1].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_de]=0;
CPDOMDisplayServerInstructions[_de+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_de+2]=NULL;
CPDOMDisplayServerInstructions[_de+3]=_DOMImageSizes[0].width;
CPDOMDisplayServerInstructions[_de+4]=0;
if(!_DOMImageParts[2].CPDOMDisplayContext){
_DOMImageParts[2].CPDOMDisplayContext=[];
}
var _de=_DOMImageParts[2].CPDOMDisplayContext[0];
if(!(_de>=0)){
_de=_DOMImageParts[2].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_de]=1;
CPDOMDisplayServerInstructions[_de+1]=_DOMImageParts[2];
CPDOMDisplayServerInstructions[_de+2]=NULL;
CPDOMDisplayServerInstructions[_de+3]=0;
CPDOMDisplayServerInstructions[_de+4]=0;
if(!_DOMImageParts[3].CPDOMDisplayContext){
_DOMImageParts[3].CPDOMDisplayContext=[];
}
var _de=_DOMImageParts[3].CPDOMDisplayContext[0];
if(!(_de>=0)){
_de=_DOMImageParts[3].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_de]=0;
CPDOMDisplayServerInstructions[_de+1]=_DOMImageParts[3];
CPDOMDisplayServerInstructions[_de+2]=NULL;
CPDOMDisplayServerInstructions[_de+3]=0;
CPDOMDisplayServerInstructions[_de+4]=_DOMImageSizes[1].height;
if(!_DOMImageParts[4].CPDOMDisplayContext){
_DOMImageParts[4].CPDOMDisplayContext=[];
}
var _de=_DOMImageParts[4].CPDOMDisplayContext[0];
if(!(_de>=0)){
_de=_DOMImageParts[4].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_de]=0;
CPDOMDisplayServerInstructions[_de+1]=_DOMImageParts[4];
CPDOMDisplayServerInstructions[_de+2]=NULL;
CPDOMDisplayServerInstructions[_de+3]=_DOMImageSizes[0].width;
CPDOMDisplayServerInstructions[_de+4]=_DOMImageSizes[0].height;
if(!_DOMImageParts[5].CPDOMDisplayContext){
_DOMImageParts[5].CPDOMDisplayContext=[];
}
var _de=_DOMImageParts[5].CPDOMDisplayContext[0];
if(!(_de>=0)){
_de=_DOMImageParts[5].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_de]=1;
CPDOMDisplayServerInstructions[_de+1]=_DOMImageParts[5];
CPDOMDisplayServerInstructions[_de+2]=NULL;
CPDOMDisplayServerInstructions[_de+3]=0;
CPDOMDisplayServerInstructions[_de+4]=_DOMImageSizes[1].height;
if(!_DOMImageParts[6].CPDOMDisplayContext){
_DOMImageParts[6].CPDOMDisplayContext=[];
}
var _de=_DOMImageParts[6].CPDOMDisplayContext[0];
if(!(_de>=0)){
_de=_DOMImageParts[6].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_de]=2;
CPDOMDisplayServerInstructions[_de+1]=_DOMImageParts[6];
CPDOMDisplayServerInstructions[_de+2]=NULL;
CPDOMDisplayServerInstructions[_de+3]=0;
CPDOMDisplayServerInstructions[_de+4]=0;
if(!_DOMImageParts[7].CPDOMDisplayContext){
_DOMImageParts[7].CPDOMDisplayContext=[];
}
var _de=_DOMImageParts[7].CPDOMDisplayContext[0];
if(!(_de>=0)){
_de=_DOMImageParts[7].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_de]=2;
CPDOMDisplayServerInstructions[_de+1]=_DOMImageParts[7];
CPDOMDisplayServerInstructions[_de+2]=NULL;
CPDOMDisplayServerInstructions[_de+3]=_DOMImageSizes[6].width;
CPDOMDisplayServerInstructions[_de+4]=0;
if(!_DOMImageParts[8].CPDOMDisplayContext){
_DOMImageParts[8].CPDOMDisplayContext=[];
}
var _de=_DOMImageParts[8].CPDOMDisplayContext[0];
if(!(_de>=0)){
_de=_DOMImageParts[8].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_de]=3;
CPDOMDisplayServerInstructions[_de+1]=_DOMImageParts[8];
CPDOMDisplayServerInstructions[_de+2]=NULL;
CPDOMDisplayServerInstructions[_de+3]=0;
CPDOMDisplayServerInstructions[_de+4]=0;
}else{
if(_backgroundType==_5){
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _de=_DOMImageParts[1].CPDOMDisplayContext[4];
if(!(_de>=0)){
_de=_DOMImageParts[1].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_de]=4;
CPDOMDisplayServerInstructions[_de+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_de+2]=_db.width;
CPDOMDisplayServerInstructions[_de+3]=_db.height-_DOMImageSizes[0].height-_DOMImageSizes[2].height;
if(!_DOMImageParts[0].CPDOMDisplayContext){
_DOMImageParts[0].CPDOMDisplayContext=[];
}
var _de=_DOMImageParts[0].CPDOMDisplayContext[0];
if(!(_de>=0)){
_de=_DOMImageParts[0].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_de]=0;
CPDOMDisplayServerInstructions[_de+1]=_DOMImageParts[0];
CPDOMDisplayServerInstructions[_de+2]=NULL;
CPDOMDisplayServerInstructions[_de+3]=0;
CPDOMDisplayServerInstructions[_de+4]=0;
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _de=_DOMImageParts[1].CPDOMDisplayContext[0];
if(!(_de>=0)){
_de=_DOMImageParts[1].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_de]=0;
CPDOMDisplayServerInstructions[_de+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_de+2]=NULL;
CPDOMDisplayServerInstructions[_de+3]=0;
CPDOMDisplayServerInstructions[_de+4]=_DOMImageSizes[0].height;
if(!_DOMImageParts[2].CPDOMDisplayContext){
_DOMImageParts[2].CPDOMDisplayContext=[];
}
var _de=_DOMImageParts[2].CPDOMDisplayContext[0];
if(!(_de>=0)){
_de=_DOMImageParts[2].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_de]=2;
CPDOMDisplayServerInstructions[_de+1]=_DOMImageParts[2];
CPDOMDisplayServerInstructions[_de+2]=NULL;
CPDOMDisplayServerInstructions[_de+3]=0;
CPDOMDisplayServerInstructions[_de+4]=0;
}else{
if(_backgroundType==_6){
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _de=_DOMImageParts[1].CPDOMDisplayContext[4];
if(!(_de>=0)){
_de=_DOMImageParts[1].CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_de]=4;
CPDOMDisplayServerInstructions[_de+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_de+2]=_db.width-_DOMImageSizes[0].width-_DOMImageSizes[2].width;
CPDOMDisplayServerInstructions[_de+3]=_db.height;
if(!_DOMImageParts[0].CPDOMDisplayContext){
_DOMImageParts[0].CPDOMDisplayContext=[];
}
var _de=_DOMImageParts[0].CPDOMDisplayContext[0];
if(!(_de>=0)){
_de=_DOMImageParts[0].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_de]=0;
CPDOMDisplayServerInstructions[_de+1]=_DOMImageParts[0];
CPDOMDisplayServerInstructions[_de+2]=NULL;
CPDOMDisplayServerInstructions[_de+3]=0;
CPDOMDisplayServerInstructions[_de+4]=0;
if(!_DOMImageParts[1].CPDOMDisplayContext){
_DOMImageParts[1].CPDOMDisplayContext=[];
}
var _de=_DOMImageParts[1].CPDOMDisplayContext[0];
if(!(_de>=0)){
_de=_DOMImageParts[1].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_de]=0;
CPDOMDisplayServerInstructions[_de+1]=_DOMImageParts[1];
CPDOMDisplayServerInstructions[_de+2]=NULL;
CPDOMDisplayServerInstructions[_de+3]=_DOMImageSizes[0].width;
CPDOMDisplayServerInstructions[_de+4]=0;
if(!_DOMImageParts[2].CPDOMDisplayContext){
_DOMImageParts[2].CPDOMDisplayContext=[];
}
var _de=_DOMImageParts[2].CPDOMDisplayContext[0];
if(!(_de>=0)){
_de=_DOMImageParts[2].CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_de]=1;
CPDOMDisplayServerInstructions[_de+1]=_DOMImageParts[2];
CPDOMDisplayServerInstructions[_de+2]=NULL;
CPDOMDisplayServerInstructions[_de+3]=0;
CPDOMDisplayServerInstructions[_de+4]=0;
}
}
}
}
}
}),new objj_method(sel_getUid("backgroundColor"),function(_e1,_e2){
with(_e1){
return _backgroundColor;
}
}),new objj_method(sel_getUid("convertPoint:fromView:"),function(_e3,_e4,_e5,_e6){
with(_e3){
return CGPointApplyAffineTransform(_e5,_e7(_e6,_e3));
}
}),new objj_method(sel_getUid("convertPoint:toView:"),function(_e8,_e9,_ea,_eb){
with(_e8){
return CGPointApplyAffineTransform(_ea,_e7(_e8,_eb));
}
}),new objj_method(sel_getUid("convertSize:fromView:"),function(_ec,_ed,_ee,_ef){
with(_ec){
return CGSizeApplyAffineTransform(_ee,_e7(_ef,_ec));
}
}),new objj_method(sel_getUid("convertSize:toView:"),function(_f0,_f1,_f2,_f3){
with(_f0){
return CGSizeApplyAffineTransform(_f2,_e7(_f0,_f3));
}
}),new objj_method(sel_getUid("convertRect:fromView:"),function(_f4,_f5,_f6,_f7){
with(_f4){
return CGRectApplyAffineTransform(_f6,_e7(_f7,_f4));
}
}),new objj_method(sel_getUid("convertRect:toView:"),function(_f8,_f9,_fa,_fb){
with(_f8){
return CGRectApplyAffineTransform(_fa,_e7(_f8,_fb));
}
}),new objj_method(sel_getUid("setPostsFrameChangedNotifications:"),function(_fc,_fd,_fe){
with(_fc){
_fe=!!_fe;
if(_postsFrameChangedNotifications===_fe){
return;
}
_postsFrameChangedNotifications=_fe;
if(_postsFrameChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewFrameDidChangeNotification,_fc);
}
}
}),new objj_method(sel_getUid("postsFrameChangedNotifications"),function(_ff,_cmd){
with(_ff){
return _postsFrameChangedNotifications;
}
}),new objj_method(sel_getUid("setPostsBoundsChangedNotifications:"),function(self,_cmd,_103){
with(self){
_103=!!_103;
if(_postsBoundsChangedNotifications===_103){
return;
}
_postsBoundsChangedNotifications=_103;
if(_postsBoundsChangedNotifications){
objj_msgSend(_1,"postNotificationName:object:",CPViewBoundsDidChangeNotification,self);
}
}
}),new objj_method(sel_getUid("postsBoundsChangedNotifications"),function(self,_cmd){
with(self){
return _postsBoundsChangedNotifications;
}
}),new objj_method(sel_getUid("dragImage:at:offset:event:pasteboard:source:slideBack:"),function(self,_cmd,_108,_109,_10a,_10b,_10c,_10d,_10e){
with(self){
objj_msgSend(_window,"dragImage:at:offset:event:pasteboard:source:slideBack:",_108,objj_msgSend(self,"convertPoint:toView:",_109,nil),_10a,_10b,_10c,_10d,_10e);
}
}),new objj_method(sel_getUid("dragView:at:offset:event:pasteboard:source:slideBack:"),function(self,_cmd,_111,_112,_113,_114,_115,_116,_117){
with(self){
objj_msgSend(_window,"dragView:at:offset:event:pasteboard:source:slideBack:",_111,objj_msgSend(self,"convertPoint:toView:",_112,nil),_113,_114,_115,_116,_117);
}
}),new objj_method(sel_getUid("registerForDraggedTypes:"),function(self,_cmd,_11a){
with(self){
if(!_11a||!objj_msgSend(_11a,"count")){
return;
}
var _11b=objj_msgSend(self,"window");
objj_msgSend(_11b,"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
objj_msgSend(_registeredDraggedTypes,"addObjectsFromArray:",_11a);
objj_msgSend(_11b,"_noteRegisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypesArray=nil;
}
}),new objj_method(sel_getUid("registeredDraggedTypes"),function(self,_cmd){
with(self){
if(!_registeredDraggedTypesArray){
_registeredDraggedTypesArray=objj_msgSend(_registeredDraggedTypes,"allObjects");
}
return _registeredDraggedTypesArray;
}
}),new objj_method(sel_getUid("unregisterDraggedTypes"),function(self,_cmd){
with(self){
objj_msgSend(objj_msgSend(self,"window"),"_noteUnregisteredDraggedTypes:",_registeredDraggedTypes);
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
}
}),new objj_method(sel_getUid("drawRect:"),function(self,_cmd,_122){
with(self){
}
}),new objj_method(sel_getUid("setNeedsDisplay:"),function(self,_cmd,_125){
with(self){
if(_125){
objj_msgSend(self,"setNeedsDisplayInRect:",objj_msgSend(self,"bounds"));
}else{
var _126=CPDOMDisplayServerViewsContext[objj_msgSend(self,"UID")];
if(typeof _126!="undefined"){
CPDOMDisplayServerViewsContext[objj_msgSend(self,"UID")];
CPDOMDisplayServerViews[_126]=NULL;
}
}
}
}),new objj_method(sel_getUid("setNeedsDisplayInRect:"),function(self,_cmd,_129){
with(self){
if(!(_viewClassFlags&_9)){
return;
}
if((_129.size.width<=0||_129.size.height<=0)){
return;
}
if(_dirtyRect&&!(_dirtyRect.size.width<=0||_dirtyRect.size.height<=0)){
_dirtyRect=CGRectUnion(_129,_dirtyRect);
}else{
_dirtyRect={origin:{x:_129.origin.x,y:_129.origin.y},size:{width:_129.size.width,height:_129.size.height}};
}
var _12a=objj_msgSend(self,"UID");
if(typeof (CPDOMDisplayServerViewsContext[_12a])=="undefined"){
CPDOMDisplayServerViews[CPDOMDisplayServerViewsCount++]=self;
CPDOMDisplayServerViewsContext[_12a]=self;
}
}
}),new objj_method(sel_getUid("needsDisplay"),function(self,_cmd){
with(self){
return _dirtyRect&&!(_dirtyRect.size.width<=0||_dirtyRect.size.height<=0);
}
}),new objj_method(sel_getUid("displayIfNeeded"),function(self,_cmd){
with(self){
if(objj_msgSend(self,"needsDisplay")){
objj_msgSend(self,"displayRect:",_dirtyRect);
}
}
}),new objj_method(sel_getUid("display"),function(self,_cmd){
with(self){
objj_msgSend(self,"displayRect:",objj_msgSend(self,"visibleRect"));
}
}),new objj_method(sel_getUid("displayIfNeededInRect:"),function(self,_cmd,_133){
with(self){
if(objj_msgSend(self,"needsDisplay")){
objj_msgSend(self,"displayRect:",_133);
}
}
}),new objj_method(sel_getUid("displayRect:"),function(self,_cmd,_136){
with(self){
objj_msgSend(self,"viewWillDraw");
objj_msgSend(self,"displayRectIgnoringOpacity:inContext:",_136,nil);
_dirtyRect=NULL;
}
}),new objj_method(sel_getUid("displayRectIgnoringOpacity:inContext:"),function(self,_cmd,_139,_13a){
with(self){
objj_msgSend(self,"lockFocus");
CGContextClearRect(objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_139);
objj_msgSend(self,"drawRect:",_139);
objj_msgSend(self,"unlockFocus");
}
}),new objj_method(sel_getUid("viewWillDraw"),function(self,_cmd){
with(self){
}
}),new objj_method(sel_getUid("lockFocus"),function(self,_cmd){
with(self){
if(!_graphicsContext){
var _13f=CGBitmapGraphicsContextCreate();
_DOMContentsElement=_13f.DOMElement;
_DOMContentsElement.style.zIndex=-100;
_DOMContentsElement.style.overflow="hidden";
_DOMContentsElement.style.position="absolute";
_DOMContentsElement.style.visibility="visible";
_DOMContentsElement.width=ROUND((_frame.size.width));
_DOMContentsElement.height=ROUND((_frame.size.height));
_DOMContentsElement.style.top="0px";
_DOMContentsElement.style.left="0px";
_DOMContentsElement.style.width=ROUND((_frame.size.width))+"px";
_DOMContentsElement.style.height=ROUND((_frame.size.height))+"px";
if(_DOMContentsElement.CPDOMDisplayContext){
_DOMContentsElement.CPDOMDisplayContext[0]=-1;
}
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=6;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMContentsElement;
_graphicsContext=objj_msgSend(CPGraphicsContext,"graphicsContextWithGraphicsPort:flipped:",_13f,YES);
}
objj_msgSend(CPGraphicsContext,"setCurrentContext:",_graphicsContext);
CGContextSaveGState(objj_msgSend(_graphicsContext,"graphicsPort"));
}
}),new objj_method(sel_getUid("unlockFocus"),function(self,_cmd){
with(self){
CGContextRestoreGState(objj_msgSend(_graphicsContext,"graphicsPort"));
objj_msgSend(CPGraphicsContext,"setCurrentContext:",nil);
}
}),new objj_method(sel_getUid("setNeedsLayout"),function(self,_cmd){
with(self){
_needsLayout=YES;
if(!(_viewClassFlags&_a)){
return;
}
var _144=objj_msgSend(self,"UID");
if(typeof (CPDOMDisplayServerViewsContext[_144])=="undefined"){
CPDOMDisplayServerViews[CPDOMDisplayServerViewsCount++]=self;
CPDOMDisplayServerViewsContext[_144]=self;
}
}
}),new objj_method(sel_getUid("layoutIfNeeded"),function(self,_cmd){
with(self){
if(_needsLayout){
_needsLayout=NO;
objj_msgSend(self,"layoutSubviews");
}
}
}),new objj_method(sel_getUid("layoutSubviews"),function(self,_cmd){
with(self){
}
}),new objj_method(sel_getUid("isOpaque"),function(self,_cmd){
with(self){
return NO;
}
}),new objj_method(sel_getUid("visibleRect"),function(self,_cmd){
with(self){
if(!_superview){
return _bounds;
}
return CGRectIntersection(objj_msgSend(self,"convertRect:fromView:",objj_msgSend(_superview,"visibleRect"),_superview),_bounds);
}
}),new objj_method(sel_getUid("_enclosingClipView"),function(self,_cmd){
with(self){
var _14f=_superview,_150=objj_msgSend(CPClipView,"class");
while(_14f&&!objj_msgSend(_14f,"isKindOfClass:",_150)){
_14f=_14f._superview;
}
return _14f;
}
}),new objj_method(sel_getUid("scrollPoint:"),function(self,_cmd,_153){
with(self){
var _154=objj_msgSend(self,"_enclosingClipView");
if(!_154){
return;
}
objj_msgSend(_154,"scrollToPoint:",objj_msgSend(self,"convertPoint:toView:",_153,_154));
}
}),new objj_method(sel_getUid("scrollRectToVisible:"),function(self,_cmd,_157){
with(self){
var _158=objj_msgSend(self,"visibleRect");
_157=CGRectIntersection(_157,_bounds);
if((_157.size.width<=0||_157.size.height<=0)||CGRectContainsRect(_158,_157)){
return NO;
}
var _159=objj_msgSend(self,"_enclosingClipView");
if(!_159){
return NO;
}
var _15a={x:_158.origin.x,y:_158.origin.y};
if((_157.origin.x)<=(_158.origin.x)){
_15a.x=(_157.origin.x);
}else{
if((_157.origin.x+_157.size.width)>(_158.origin.x+_158.size.width)){
_15a.x+=(_157.origin.x+_157.size.width)-(_158.origin.x+_158.size.width);
}
}
if((_157.origin.y)<=(_158.origin.y)){
_15a.y=CGRectGetMinY(_157);
}else{
if((_157.origin.y+_157.size.height)>(_158.origin.y+_158.size.height)){
_15a.y+=(_157.origin.y+_157.size.height)-(_158.origin.y+_158.size.height);
}
}
objj_msgSend(_159,"scrollToPoint:",CGPointMake(_15a.x,_15a.y));
return YES;
}
}),new objj_method(sel_getUid("autoscroll:"),function(self,_cmd,_15d){
with(self){
return objj_msgSend(objj_msgSend(self,"superview"),"autoscroll:",_15d);
}
}),new objj_method(sel_getUid("adjustScroll:"),function(self,_cmd,_160){
with(self){
return _160;
}
}),new objj_method(sel_getUid("scrollRect:by:"),function(self,_cmd,_163,_164){
with(self){
}
}),new objj_method(sel_getUid("enclosingScrollView"),function(self,_cmd){
with(self){
var _167=_superview,_168=objj_msgSend(CPScrollView,"class");
while(_167&&!objj_msgSend(_167,"isKindOfClass:",_168)){
_167=_167._superview;
}
return _167;
}
}),new objj_method(sel_getUid("scrollClipView:toPoint:"),function(self,_cmd,_16b,_16c){
with(self){
objj_msgSend(_16b,"scrollToPoint:",_16c);
}
}),new objj_method(sel_getUid("reflectScrolledClipView:"),function(self,_cmd,_16f){
with(self){
}
})]);
class_addMethods(_c,[new objj_method(sel_getUid("initialize"),function(self,_cmd){
with(self){
if(self!==objj_msgSend(CPView,"class")){
return;
}
_3=document.createElement("div");
var _172=_3.style;
_172.overflow="hidden";
_172.position="absolute";
_172.visibility="visible";
_172.zIndex=0;
_1=objj_msgSend(CPNotificationCenter,"defaultCenter");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingFrame"),function(self,_cmd){
with(self){
return objj_msgSend(CPSet,"setWithObjects:","frameOrigin","frameSize");
}
})]);
var _b=objj_getClass("CPView");
if(!_b){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _c=_b.isa;
class_addMethods(_b,[new objj_method(sel_getUid("canBecomeKeyView"),function(self,_cmd){
with(self){
return objj_msgSend(self,"acceptsFirstResponder")&&!objj_msgSend(self,"isHiddenOrHasHiddenAncestor");
}
}),new objj_method(sel_getUid("nextKeyView"),function(self,_cmd){
with(self){
return _nextKeyView;
}
}),new objj_method(sel_getUid("nextValidKeyView"),function(self,_cmd){
with(self){
var _17b=objj_msgSend(self,"nextKeyView");
while(_17b&&!objj_msgSend(_17b,"canBecomeKeyView")){
_17b=objj_msgSend(_17b,"nextKeyView");
}
return _17b;
}
}),new objj_method(sel_getUid("previousKeyView"),function(self,_cmd){
with(self){
return _previousKeyView;
}
}),new objj_method(sel_getUid("previousValidKeyView"),function(self,_cmd){
with(self){
var _180=objj_msgSend(self,"previousKeyView");
while(_180&&!objj_msgSend(_180,"canBecomeKeyView")){
_180=objj_msgSend(_180,"previousKeyView");
}
return _180;
}
}),new objj_method(sel_getUid("_setPreviousKeyView:"),function(self,_cmd,_183){
with(self){
_previousKeyView=_183;
}
}),new objj_method(sel_getUid("setNextKeyView:"),function(self,_cmd,next){
with(self){
_nextKeyView=next;
objj_msgSend(_nextKeyView,"_setPreviousKeyView:",self);
}
})]);
var _b=objj_getClass("CPView");
if(!_b){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _c=_b.isa;
class_addMethods(_b,[new objj_method(sel_getUid("setLayer:"),function(self,_cmd,_189){
with(self){
if(_layer==_189){
return;
}
if(_layer){
_layer._owningView=nil;
_DOMElement.removeChild(_layer._DOMElement);
}
_layer=_189;
if(_layer){
var _18a=CGRectMakeCopy(objj_msgSend(self,"bounds"));
objj_msgSend(_layer,"_setOwningView:",self);
_layer._DOMElement.style.zIndex=100;
_DOMElement.appendChild(_layer._DOMElement);
}
}
}),new objj_method(sel_getUid("layer"),function(self,_cmd){
with(self){
return _layer;
}
}),new objj_method(sel_getUid("setWantsLayer:"),function(self,_cmd,_18f){
with(self){
_wantsLayer=!!_18f;
}
}),new objj_method(sel_getUid("wantsLayer"),function(self,_cmd){
with(self){
return _wantsLayer;
}
})]);
var _b=objj_getClass("CPView");
if(!_b){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _c=_b.isa;
class_addMethods(_b,[new objj_method(sel_getUid("themeState"),function(self,_cmd){
with(self){
return _themeState;
}
}),new objj_method(sel_getUid("hasThemeState:"),function(self,_cmd,_196){
with(self){
return !!(_themeState&((typeof _196==="string")?CPThemeState(_196):_196));
}
}),new objj_method(sel_getUid("setThemeState:"),function(self,_cmd,_199){
with(self){
var _19a=(typeof _199==="string")?CPThemeState(_199):_199;
if(_themeState&_19a){
return NO;
}
_themeState|=_19a;
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
return YES;
}
}),new objj_method(sel_getUid("unsetThemeState:"),function(self,_cmd,_19d){
with(self){
var _19e=((typeof _19d==="string")?CPThemeState(_19d):_19d);
if(!(_themeState&_19e)){
return NO;
}
_themeState&=~_19e;
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
return YES;
}
}),new objj_method(sel_getUid("_loadThemeAttributes"),function(self,_cmd){
with(self){
var _1a1=objj_msgSend(self,"class"),_1a2=objj_msgSend(_1a1,"_themeAttributes"),_1a3=_1a2.length;
if(!_1a3){
return;
}
var _1a4=objj_msgSend(self,"theme"),_1a5=objj_msgSend(_1a1,"themeClass");
_themeAttributes={};
while(_1a3--){
var _1a6=_1a2[_1a3--],_1a7=objj_msgSend(objj_msgSend(_CPThemeAttribute,"alloc"),"initWithName:defaultValue:",_1a6,_1a2[_1a3]);
objj_msgSend(_1a7,"setParentAttribute:",objj_msgSend(_1a4,"_attributeWithName:forClass:",_1a6,_1a5));
_themeAttributes[_1a6]=_1a7;
}
}
}),new objj_method(sel_getUid("setTheme:"),function(self,_cmd,_1aa){
with(self){
if(_theme===_1aa){
return;
}
_theme=_1aa;
objj_msgSend(self,"viewDidChangeTheme");
}
}),new objj_method(sel_getUid("theme"),function(self,_cmd){
with(self){
return _theme;
}
}),new objj_method(sel_getUid("viewDidChangeTheme"),function(self,_cmd){
with(self){
if(!_themeAttributes){
return;
}
var _1af=objj_msgSend(self,"theme"),_1b0=objj_msgSend(objj_msgSend(self,"class"),"themeClass");
for(var _1b1 in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_1b1)){
objj_msgSend(_themeAttributes[_1b1],"setParentAttribute:",objj_msgSend(_1af,"_attributeWithName:forClass:",_1b1,_1b0));
}
}
objj_msgSend(self,"setNeedsLayout");
objj_msgSend(self,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("_themeAttributeDictionary"),function(self,_cmd){
with(self){
var _1b4=objj_msgSend(CPDictionary,"dictionary");
if(_themeAttributes){
var _1b5=objj_msgSend(self,"theme");
for(var _1b6 in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_1b6)){
objj_msgSend(_1b4,"setObject:forKey:",_themeAttributes[_1b6],_1b6);
}
}
}
return _1b4;
}
}),new objj_method(sel_getUid("setValue:forThemeAttribute:inState:"),function(self,_cmd,_1b9,_1ba,_1bb){
with(self){
if(!_themeAttributes||!_themeAttributes[_1ba]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1ba+"'");
}
var _1bc=objj_msgSend(self,"currentValueForThemeAttribute:",_1ba);
objj_msgSend(_themeAttributes[_1ba],"setValue:forState:",_1b9,_1bb);
if(objj_msgSend(self,"currentValueForThemeAttribute:",_1ba)===_1bc){
return;
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setValue:forThemeAttribute:"),function(self,_cmd,_1bf,_1c0){
with(self){
if(!_themeAttributes||!_themeAttributes[_1c0]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1c0+"'");
}
var _1c1=objj_msgSend(self,"currentValueForThemeAttribute:",_1c0);
objj_msgSend(_themeAttributes[_1c0],"setValue:",_1bf);
if(objj_msgSend(self,"currentValueForThemeAttribute:",_1c0)===_1c1){
return;
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("valueForThemeAttribute:inState:"),function(self,_cmd,_1c4,_1c5){
with(self){
if(!_themeAttributes||!_themeAttributes[_1c4]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1c4+"'");
}
return objj_msgSend(_themeAttributes[_1c4],"valueForState:",_1c5);
}
}),new objj_method(sel_getUid("valueForThemeAttribute:"),function(self,_cmd,_1c8){
with(self){
if(!_themeAttributes||!_themeAttributes[_1c8]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1c8+"'");
}
return objj_msgSend(_themeAttributes[_1c8],"value");
}
}),new objj_method(sel_getUid("currentValueForThemeAttribute:"),function(self,_cmd,_1cb){
with(self){
if(!_themeAttributes||!_themeAttributes[_1cb]){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(self,"className")+" does not contain theme attribute '"+_1cb+"'");
}
return objj_msgSend(_themeAttributes[_1cb],"valueForState:",_themeState);
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(self,_cmd,_1ce){
with(self){
return nil;
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(self,_cmd,_1d1){
with(self){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
}),new objj_method(sel_getUid("layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:"),function(self,_cmd,_1d4,_1d5,_1d6){
with(self){
if(!_ephemeralSubviewsForNames){
_ephemeralSubviewsForNames={};
_ephemeralSubviews=objj_msgSend(CPSet,"set");
}
var _1d7=objj_msgSend(self,"rectForEphemeralSubviewNamed:",_1d4);
if(_1d7&&!(_1d7.size.width<=0||_1d7.size.height<=0)){
if(!_ephemeralSubviewsForNames[_1d4]){
_ephemeralSubviewsForNames[_1d4]=objj_msgSend(self,"createEphemeralSubviewNamed:",_1d4);
objj_msgSend(_ephemeralSubviews,"addObject:",_ephemeralSubviewsForNames[_1d4]);
if(_ephemeralSubviewsForNames[_1d4]){
objj_msgSend(self,"addSubview:positioned:relativeTo:",_ephemeralSubviewsForNames[_1d4],_1d5,_ephemeralSubviewsForNames[_1d6]);
}
}
if(_ephemeralSubviewsForNames[_1d4]){
objj_msgSend(_ephemeralSubviewsForNames[_1d4],"setFrame:",_1d7);
}
}else{
if(_ephemeralSubviewsForNames[_1d4]){
objj_msgSend(_ephemeralSubviewsForNames[_1d4],"removeFromSuperview");
objj_msgSend(_ephemeralSubviews,"removeObject:",_ephemeralSubviewsForNames[_1d4]);
delete _ephemeralSubviewsForNames[_1d4];
}
}
return _ephemeralSubviewsForNames[_1d4];
}
})]);
class_addMethods(_c,[new objj_method(sel_getUid("themeClass"),function(self,_cmd){
with(self){
return nil;
}
}),new objj_method(sel_getUid("themeAttributes"),function(self,_cmd){
with(self){
return nil;
}
}),new objj_method(sel_getUid("_themeAttributes"),function(self,_cmd){
with(self){
if(!_2){
_2={};
}
var _1de=objj_msgSend(self,"class"),_1df=objj_msgSend(CPView,"class"),_1e0=[];
for(;_1de&&_1de!==_1df;_1de=objj_msgSend(_1de,"superclass")){
var _1e1=_2[class_getName(_1de)];
if(_1e1){
_1e0=_1e0.length?_1e0.concat(_1e1):_1e0;
_2[objj_msgSend(self,"className")]=_1e0;
break;
}
var _1e2=objj_msgSend(_1de,"themeAttributes");
if(!_1e2){
continue;
}
var _1e3=objj_msgSend(_1e2,"allKeys"),_1e4=_1e3.length;
while(_1e4--){
var _1e5=_1e3[_1e4];
_1e0.push(objj_msgSend(_1e2,"objectForKey:",_1e5));
_1e0.push(_1e5);
}
}
return _1e0;
}
})]);
var _1e6="CPViewAutoresizingMask",_1e7="CPViewAutoresizesSubviews",_1e8="CPViewBackgroundColor",_1e9="CPViewBoundsKey",_1ea="CPViewFrameKey",_1eb="CPViewHitTestsKey",_1ec="CPViewIsHiddenKey",_1ed="CPViewOpacityKey",_1ee="CPViewSubviewsKey",_1ef="CPViewSuperviewKey",_1f0="CPViewTagKey",_1f1="CPViewThemeStateKey",_1f2="CPViewWindowKey",_1f3="CPViewNextKeyViewKey",_1f4="CPViewPreviousKeyViewKey";
var _b=objj_getClass("CPView");
if(!_b){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPView\""));
}
var _c=_b.isa;
class_addMethods(_b,[new objj_method(sel_getUid("initWithCoder:"),function(self,_cmd,_1f7){
with(self){
_DOMElement=_3.cloneNode(false);
_frame=objj_msgSend(_1f7,"decodeRectForKey:",_1ea);
_bounds=objj_msgSend(_1f7,"decodeRectForKey:",_1e9);
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPResponder")},"initWithCoder:",_1f7);
if(self){
_tag=objj_msgSend(_1f7,"containsValueForKey:",_1f0)?objj_msgSend(_1f7,"decodeIntForKey:",_1f0):-1;
_window=objj_msgSend(_1f7,"decodeObjectForKey:",_1f2);
_subviews=objj_msgSend(_1f7,"decodeObjectForKey:",_1ee)||[];
_superview=objj_msgSend(_1f7,"decodeObjectForKey:",_1ef);
_registeredDraggedTypes=objj_msgSend(CPSet,"set");
_registeredDraggedTypesArray=[];
_autoresizingMask=objj_msgSend(_1f7,"decodeIntForKey:",_1e6)||CPViewNotSizable;
_autoresizesSubviews=!objj_msgSend(_1f7,"containsValueForKey:",_1e7)||objj_msgSend(_1f7,"decodeBoolForKey:",_1e7);
_hitTests=!objj_msgSend(_1f7,"containsValueForKey:",_1eb)||objj_msgSend(_1f7,"decodeObjectForKey:",_1eb);
_DOMImageParts=[];
_DOMImageSizes=[];
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _1f8=_DOMElement.CPDOMDisplayContext[0];
if(!(_1f8>=0)){
_1f8=_DOMElement.CPDOMDisplayContext[0]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=5;
}
CPDOMDisplayServerInstructions[_1f8]=0;
CPDOMDisplayServerInstructions[_1f8+1]=_DOMElement;
CPDOMDisplayServerInstructions[_1f8+2]=NULL;
CPDOMDisplayServerInstructions[_1f8+3]=(_frame.origin.x);
CPDOMDisplayServerInstructions[_1f8+4]=(_frame.origin.y);
if(!_DOMElement.CPDOMDisplayContext){
_DOMElement.CPDOMDisplayContext=[];
}
var _1f8=_DOMElement.CPDOMDisplayContext[4];
if(!(_1f8>=0)){
_1f8=_DOMElement.CPDOMDisplayContext[4]=CPDOMDisplayServerInstructionCount;
CPDOMDisplayServerInstructionCount+=4;
}
CPDOMDisplayServerInstructions[_1f8]=4;
CPDOMDisplayServerInstructions[_1f8+1]=_DOMElement;
CPDOMDisplayServerInstructions[_1f8+2]=(_frame.size.width);
CPDOMDisplayServerInstructions[_1f8+3]=(_frame.size.height);
var _1f9=0,_1fa=_subviews.length;
for(;_1f9<_1fa;++_1f9){
if(_subviews[_1f9]._DOMElement.CPDOMDisplayContext){
_subviews[_1f9]._DOMElement.CPDOMDisplayContext[0]=-1;
}
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=6;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_DOMElement;
CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++]=_subviews[_1f9]._DOMElement;
}
if(objj_msgSend(_1f7,"containsValueForKey:",_1ec)){
objj_msgSend(self,"setHidden:",objj_msgSend(_1f7,"decodeBoolForKey:",_1ec));
}else{
_isHidden=NO;
}
if(objj_msgSend(_1f7,"containsValueForKey:",_1ed)){
objj_msgSend(self,"setAlphaValue:",objj_msgSend(_1f7,"decodeIntForKey:",_1ed));
}else{
_opacity=1;
}
objj_msgSend(self,"setBackgroundColor:",objj_msgSend(_1f7,"decodeObjectForKey:",_1e8));
objj_msgSend(self,"setupViewFlags");
_theme=objj_msgSend(CPTheme,"defaultTheme");
_themeState=CPThemeState(objj_msgSend(_1f7,"decodeIntForKey:",_1f1));
_themeAttributes={};
var _1fb=objj_msgSend(self,"class"),_1fc=objj_msgSend(_1fb,"themeClass"),_1fd=objj_msgSend(_1fb,"_themeAttributes"),_1fa=_1fd.length;
while(_1fa--){
var _1fe=_1fd[_1fa--];
_themeAttributes[_1fe]=CPThemeAttributeDecode(_1f7,_1fe,_1fd[_1fa],_theme,_1fc);
}
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
return self;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_cmd,_201){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPResponder")},"encodeWithCoder:",_201);
if(_tag!==-1){
objj_msgSend(_201,"encodeInt:forKey:",_tag,_1f0);
}
objj_msgSend(_201,"encodeRect:forKey:",_frame,_1ea);
objj_msgSend(_201,"encodeRect:forKey:",_bounds,_1e9);
if(_window!==nil){
objj_msgSend(_201,"encodeConditionalObject:forKey:",_window,_1f2);
}
var _202=objj_msgSend(_subviews,"count"),_203=_subviews;
if(_202>0&&objj_msgSend(_ephemeralSubviews,"count")>0){
_203=objj_msgSend(_203,"copy");
while(_202--){
if(objj_msgSend(_ephemeralSubviews,"containsObject:",_203[_202])){
_203.splice(_202,1);
}
}
}
if(_203.length>0){
objj_msgSend(_201,"encodeObject:forKey:",_203,_1ee);
}
if(_superview!==nil){
objj_msgSend(_201,"encodeConditionalObject:forKey:",_superview,_1ef);
}
if(_autoresizingMask!==CPViewNotSizable){
objj_msgSend(_201,"encodeInt:forKey:",_autoresizingMask,_1e6);
}
if(!_autoresizesSubviews){
objj_msgSend(_201,"encodeBool:forKey:",_autoresizesSubviews,_1e7);
}
if(_backgroundColor!==nil){
objj_msgSend(_201,"encodeObject:forKey:",_backgroundColor,_1e8);
}
if(_hitTests!==YES){
objj_msgSend(_201,"encodeBool:forKey:",_hitTests,_1eb);
}
if(_opacity!==1){
objj_msgSend(_201,"encodeFloat:forKey:",_opacity,_1ed);
}
if(_isHidden){
objj_msgSend(_201,"encodeBool:forKey:",_isHidden,_1ec);
}
var _204=objj_msgSend(self,"nextKeyView");
if(_204!==nil){
objj_msgSend(_201,"encodeConditionalObject:forKey:",_204,_1f3);
}
var _205=objj_msgSend(self,"previousKeyView");
if(_205!==nil){
objj_msgSend(_201,"encodeConditionalObject:forKey:",_205,_1f4);
}
objj_msgSend(_201,"encodeInt:forKey:",CPThemeStateName(_themeState),_1f1);
for(var _206 in _themeAttributes){
if(_themeAttributes.hasOwnProperty(_206)){
CPThemeAttributeEncode(_201,_themeAttributes[_206]);
}
}
}
})]);
var _a8=function(_207){
var _208=_207._superview;
return {autoresizingMask:_207._autoresizingMask,frame:CGRectMakeCopy(_207._frame),index:(_208?objj_msgSend(_208._subviews,"indexOfObjectIdenticalTo:",_207):0),superview:_208};
};
var _e7=function(_209,_20a){
var _20b=CGAffineTransformMakeIdentity(),_20c=YES,_20d=nil,_20e=nil;
if(_209){
var view=_209;
while(view&&view!=_20a){
var _210=view._frame;
_20b.tx+=(_210.origin.x);
_20b.ty+=(_210.origin.y);
if(view._boundsTransform){
var tx=_20b.tx*view._boundsTransform.a+_20b.ty*view._boundsTransform.c+view._boundsTransform.tx;
_20b.ty=_20b.tx*view._boundsTransform.b+_20b.ty*view._boundsTransform.d+view._boundsTransform.ty;
_20b.tx=tx;
var a=_20b.a*view._boundsTransform.a+_20b.b*view._boundsTransform.c,b=_20b.a*view._boundsTransform.b+_20b.b*view._boundsTransform.d,c=_20b.c*view._boundsTransform.a+_20b.d*view._boundsTransform.c;
_20b.d=_20b.c*view._boundsTransform.b+_20b.d*view._boundsTransform.d;
_20b.a=a;
_20b.b=b;
_20b.c=c;
}
view=view._superview;
}
if(view===_20a){
return _20b;
}else{
if(_209&&_20a){
_20d=objj_msgSend(_209,"window");
_20e=objj_msgSend(_20a,"window");
if(_20d&&_20e&&_20d!==_20e){
_20c=NO;
var _210=objj_msgSend(_20d,"frame");
_20b.tx+=(_210.origin.x);
_20b.ty+=(_210.origin.y);
}
}
}
}
var view=_20a;
while(view){
var _210=view._frame;
_20b.tx-=(_210.origin.x);
_20b.ty-=(_210.origin.y);
if(view._boundsTransform){
var tx=_20b.tx*view._inverseBoundsTransform.a+_20b.ty*view._inverseBoundsTransform.c+view._inverseBoundsTransform.tx;
_20b.ty=_20b.tx*view._inverseBoundsTransform.b+_20b.ty*view._inverseBoundsTransform.d+view._inverseBoundsTransform.ty;
_20b.tx=tx;
var a=_20b.a*view._inverseBoundsTransform.a+_20b.b*view._inverseBoundsTransform.c,b=_20b.a*view._inverseBoundsTransform.b+_20b.b*view._inverseBoundsTransform.d,c=_20b.c*view._inverseBoundsTransform.a+_20b.d*view._inverseBoundsTransform.c;
_20b.d=_20b.c*view._inverseBoundsTransform.b+_20b.d*view._inverseBoundsTransform.d;
_20b.a=a;
_20b.b=b;
_20b.c=c;
}
view=view._superview;
}
if(!_20c){
var _210=objj_msgSend(_20e,"frame");
_20b.tx-=(_210.origin.x);
_20b.ty-=(_210.origin.y);
}
return _20b;
};
