I;20;Foundation/CPArray.ji;11;CPControl.ji;15;CPTableColumn.ji;15;_CPCornerView.ji;12;CPScroller.jc;40376;
CPTableViewColumnDidMoveNotification="CPTableViewColumnDidMoveNotification";
CPTableViewColumnDidResizeNotification="CPTableViewColumnDidResizeNotification";
CPTableViewSelectionDidChangeNotification="CPTableViewSelectionDidChangeNotification";
CPTableViewSelectionIsChangingNotification="CPTableViewSelectionIsChangingNotification";
var _1=1<<2,_2=1<<3,_3=1<<4,_4=1<<5,_5=1<<6,_6=1<<7;
var _7=1<<0,_8=1<<1,_9=1<<2,_a=1<<3,_b=1<<4,_c=1<<5,_d=1<<6,_e=1<<7,_f=1<<8,_10=1<<9,_11=1<<10,_12=1<<11,_13=1<<12,_14=1<<13,_15=1<<14,_16=1<<15,_17=1<<16,_18=1<<17,_19=1<<18,_1a=1<<19;
CPTableViewSelectionHighlightStyleRegular=0;
CPTableViewSelectionHighlightStyleSourceList=1;
CPTableViewGridNone=0;
CPTableViewSolidVerticalGridLineMask=1<<0;
CPTableViewSolidHorizontalGridLineMask=1<<1;
var _1b=objj_allocateClassPair(CPView,"_CPTableDrawView"),_1c=_1b.isa;
class_addIvars(_1b,[new objj_ivar("_tableView")]);
objj_registerClassPair(_1b);
objj_addClassForBundle(_1b,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1b,[new objj_method(sel_getUid("initWithTableView:"),function(_1d,_1e,_1f){
with(_1d){
_1d=objj_msgSendSuper({receiver:_1d,super_class:objj_getClass("CPView")},"init");
if(_1d){
_tableView=_1f;
}
return _1d;
}
}),new objj_method(sel_getUid("drawRect:"),function(_20,_21,_22){
with(_20){
var _23=objj_msgSend(_20,"frame"),_24=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextTranslateCTM(_24,-(_23.origin.x),-(_23.origin.y));
objj_msgSend(_tableView,"_drawRect:",_22);
}
})]);
var _1b=objj_allocateClassPair(CPControl,"CPTableView"),_1c=_1b.isa;
class_addIvars(_1b,[new objj_ivar("_dataSource"),new objj_ivar("_implementedDataSourceMethods"),new objj_ivar("_delegate"),new objj_ivar("_implementedDelegateMethods"),new objj_ivar("_tableColumns"),new objj_ivar("_tableColumnRanges"),new objj_ivar("_dirtyTableColumnRangeIndex"),new objj_ivar("_numberOfHiddenColumns"),new objj_ivar("_objectValues"),new objj_ivar("_exposedRows"),new objj_ivar("_exposedColumns"),new objj_ivar("_dataViewsForTableColumns"),new objj_ivar("_cachedDataViews"),new objj_ivar("_allowsColumnReordering"),new objj_ivar("_allowsColumnResizing"),new objj_ivar("_allowsMultipleSelection"),new objj_ivar("_allowsEmptySelection"),new objj_ivar("_intercellSpacing"),new objj_ivar("_rowHeight"),new objj_ivar("_usesAlternatingRowBackgroundColors"),new objj_ivar("_alternatingRowBackgroundColors"),new objj_ivar("_selectionHighlightMask"),new objj_ivar("_currentHighlightedTableColumn"),new objj_ivar("_gridStyleMask"),new objj_ivar("_gridColor"),new objj_ivar("_numberOfRows"),new objj_ivar("_headerView"),new objj_ivar("_cornerView"),new objj_ivar("_selectedColumnIndexes"),new objj_ivar("_selectedRowIndexes"),new objj_ivar("_selectionAnchorRow"),new objj_ivar("_tableDrawView")]);
objj_registerClassPair(_1b);
objj_addClassForBundle(_1b,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1b,[new objj_method(sel_getUid("initWithFrame:"),function(_25,_26,_27){
with(_25){
_25=objj_msgSendSuper({receiver:_25,super_class:objj_getClass("CPControl")},"initWithFrame:",_27);
if(_25){
_allowsColumnReordering=YES;
_allowsColumnResizing=YES;
_allowsMultipleSelection=NO;
_allowsEmptySelection=YES;
_allowsColumnSelection=NO;
_tableViewFlags=0;
_selectionHighlightMask=CPTableViewSelectionHighlightStyleRegular;
objj_msgSend(_25,"setUsesAlternatingRowBackgroundColors:",NO);
objj_msgSend(_25,"setAlternatingRowBackgroundColors:",[objj_msgSend(CPColor,"whiteColor"),objj_msgSend(CPColor,"colorWithHexString:","e4e7ff")]);
_tableColumns=[];
_tableColumnRanges=[];
_dirtyTableColumnRangeIndex=CPNotFound;
_numberOfHiddenColumns=0;
_objectValues={};
_dataViewsForTableColumns={};
_dataViews=[];
_numberOfRows=0;
_exposedRows=objj_msgSend(CPIndexSet,"indexSet");
_exposedColumns=objj_msgSend(CPIndexSet,"indexSet");
_cachedDataViews={};
_intercellSpacing={width:0,height:0};
_rowHeight=19;
objj_msgSend(_25,"setGridColor:",objj_msgSend(CPColor,"grayColor"));
objj_msgSend(_25,"setGridStyleMask:",CPTableViewGridNone);
_headerView=objj_msgSend(objj_msgSend(CPTableHeaderView,"alloc"),"initWithFrame:",CGRectMake(0,0,objj_msgSend(_25,"bounds").size.width,_rowHeight));
objj_msgSend(_headerView,"setTableView:",_25);
_cornerView=objj_msgSend(objj_msgSend(_CPCornerView,"alloc"),"initWithFrame:",CGRectMake(0,0,objj_msgSend(CPScroller,"scrollerWidth"),CGRectGetHeight(objj_msgSend(_headerView,"frame"))));
_selectedColumnIndexes=objj_msgSend(CPIndexSet,"indexSet");
_selectedRowIndexes=objj_msgSend(CPIndexSet,"indexSet");
_tableDrawView=objj_msgSend(objj_msgSend(_CPTableDrawView,"alloc"),"initWithTableView:",_25);
objj_msgSend(_tableDrawView,"setBackgroundColor:",objj_msgSend(CPColor,"clearColor"));
objj_msgSend(_25,"addSubview:",_tableDrawView);
}
return _25;
}
}),new objj_method(sel_getUid("setDataSource:"),function(_28,_29,_2a){
with(_28){
if(_dataSource===_2a){
return;
}
_dataSource=_2a;
_implementedDataSourceMethods=0;
if(!_dataSource){
return;
}
if(!objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("numberOfRowsInTableView:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,objj_msgSend(_2a,"description")+" does not implement numberOfRowsInTableView:.");
}
if(!objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:objectValueForTableColumn:row:"))){
objj_msgSend(CPException,"raise:reason:",CPInternalInconsistencyException,objj_msgSend(_2a,"description")+" does not implement tableView:objectValueForTableColumn:row:");
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:setObjectValue:forTableColumn:row:"))){
_implementedDataSourceMethods|=_1;
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:setObjectValue:forTableColumn:row:"))){
_implementedDataSourceMethods|=_2;
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:namesOfPromisedFilesDroppedAtDestination:forDraggedRowsWithIndexes:"))){
_implementedDataSourceMethods|=_3;
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:validateDrop:proposedRow:proposedDropOperation:"))){
_implementedDataSourceMethods|=_4;
}
if(objj_msgSend(_dataSource,"respondsToSelector:",sel_getUid("tableView:writeRowsWithIndexes:toPasteboard:"))){
_implementedDataSourceMethods|=_5;
}
objj_msgSend(_28,"reloadData");
}
}),new objj_method(sel_getUid("dataSource"),function(_2b,_2c){
with(_2b){
return _dataSource;
}
}),new objj_method(sel_getUid("reloadData"),function(_2d,_2e){
with(_2d){
if(!_dataSource){
return;
}
_objectValues={};
objj_msgSend(_2d,"noteNumberOfRowsChanged");
objj_msgSend(_2d,"_sizeToParent");
objj_msgSend(_2d,"setNeedsLayout");
objj_msgSend(_2d,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("setDoubleAction:"),function(_2f,_30,_31){
with(_2f){
_doubleAction=_31;
}
}),new objj_method(sel_getUid("doubleAction"),function(_32,_33){
with(_32){
return _doubleAction;
}
}),new objj_method(sel_getUid("setAllowsColumnReordering:"),function(_34,_35,_36){
with(_34){
_allowsColumnReordering=!!_36;
}
}),new objj_method(sel_getUid("allowsColumnReordering"),function(_37,_38){
with(_37){
return _allowsColumnReordering;
}
}),new objj_method(sel_getUid("setAllowsColumnResizing:"),function(_39,_3a,_3b){
with(_39){
_allowsColumnResizing=!!_3b;
}
}),new objj_method(sel_getUid("allowsColumnResizing"),function(_3c,_3d){
with(_3c){
return _allowsColumnResizing;
}
}),new objj_method(sel_getUid("setAllowsMultipleSelection:"),function(_3e,_3f,_40){
with(_3e){
_allowsMultipleSelection=!!_40;
}
}),new objj_method(sel_getUid("allowsMultipleSelection"),function(_41,_42){
with(_41){
return _allowsMultipleSelection;
}
}),new objj_method(sel_getUid("setAllowsEmptySelection:"),function(_43,_44,_45){
with(_43){
_allowsEmptySelection=!!_45;
}
}),new objj_method(sel_getUid("allowsEmptySelection"),function(_46,_47){
with(_46){
return _allowsEmptySelection;
}
}),new objj_method(sel_getUid("setAllowsColumnSelection:"),function(_48,_49,_4a){
with(_48){
_allowsColumnSelection=!!_4a;
}
}),new objj_method(sel_getUid("allowsColumnSelection"),function(_4b,_4c){
with(_4b){
return _allowsColumnSelection;
}
}),new objj_method(sel_getUid("setIntercellSpacing:"),function(_4d,_4e,_4f){
with(_4d){
if((_intercellSpacing.width==_4f.width&&_intercellSpacing.height==_4f.height)){
return;
}
_intercellSpacing={width:_4f.width,height:_4f.height};
objj_msgSend(_4d,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setThemeState:"),function(_50,_51,_52){
with(_50){
}
}),new objj_method(sel_getUid("intercellSpacing"),function(_53,_54){
with(_53){
return {width:_intercellSpacing.width,height:_intercellSpacing.height};
}
}),new objj_method(sel_getUid("setRowHeight:"),function(_55,_56,_57){
with(_55){
_57=+_57;
if(_rowHeight===_57){
return;
}
_rowHeight=MAX(0,_57);
objj_msgSend(_55,"setNeedsLayout");
}
}),new objj_method(sel_getUid("rowHeight"),function(_58,_59){
with(_58){
return _rowHeight;
}
}),new objj_method(sel_getUid("setUsesAlternatingRowBackgroundColors:"),function(_5a,_5b,_5c){
with(_5a){
_usesAlternatingRowBackgroundColors=_5c;
}
}),new objj_method(sel_getUid("usesAlternatingRowBackgroundColors"),function(_5d,_5e){
with(_5d){
return _usesAlternatingRowBackgroundColors;
}
}),new objj_method(sel_getUid("setAlternatingRowBackgroundColors:"),function(_5f,_60,_61){
with(_5f){
if(objj_msgSend(_alternatingRowBackgroundColors,"isEqual:",_61)){
return;
}
_alternatingRowBackgroundColors=_61;
objj_msgSend(_5f,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("alternatingRowBackgroundColors"),function(_62,_63){
with(_62){
return _alternatingRowBackgroundColors;
}
}),new objj_method(sel_getUid("selectionHighlightStyle"),function(_64,_65){
with(_64){
return _selectionHighlightMask;
}
}),new objj_method(sel_getUid("setSelectionHighlightStyle:"),function(_66,_67,_68){
with(_66){
_selectionHighlightMask=_68;
}
}),new objj_method(sel_getUid("setGridColor:"),function(_69,_6a,_6b){
with(_69){
if(_gridColor===_6b){
return;
}
_gridColor=_6b;
objj_msgSend(_69,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("gridColor"),function(_6c,_6d){
with(_6c){
return _gridColor;
}
}),new objj_method(sel_getUid("setGridStyleMask:"),function(_6e,_6f,_70){
with(_6e){
if(_gridStyleMask===_70){
return;
}
_gridStyleMask=_70;
objj_msgSend(_6e,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("gridStyleMask"),function(_71,_72){
with(_71){
return _gridStyleMask;
}
}),new objj_method(sel_getUid("addTableColumn:"),function(_73,_74,_75){
with(_73){
objj_msgSend(_tableColumns,"addObject:",_75);
objj_msgSend(_75,"setTableView:",_73);
if(_dirtyTableColumnRangeIndex<0){
_dirtyTableColumnRangeIndex=(_tableColumns.length)-1;
}else{
_dirtyTableColumnRangeIndex=MIN((_tableColumns.length)-1,_dirtyTableColumnRangeIndex);
}
objj_msgSend(_73,"setNeedsLayout");
}
}),new objj_method(sel_getUid("removeTableColumn:"),function(_76,_77,_78){
with(_76){
if(objj_msgSend(_78,"tableView")!==_76){
return;
}
var _79=objj_msgSend(_tableColumns,"indeOfObjectIdenticalTo:",_78);
if(_79===CPNotFound){
return;
}
objj_msgSend(_78,"setTableView:",nil);
objj_msgSend(_tableColumns,"removeObjectAtIndex:",_79);
var _7a=objj_msgSend(_78,"UID");
if(_objectValues[_7a]){
_objectValues[_7a]=nil;
}
if(_dirtyTableColumnRangeIndex<0){
_dirtyTableColumnRangeIndex=_79;
}else{
_dirtyTableColumnRangeIndex=MIN(_79,_dirtyTableColumnRangeIndex);
}
objj_msgSend(_76,"setNeedsLayout");
}
}),new objj_method(sel_getUid("moveColumn:toColumn:"),function(_7b,_7c,_7d,_7e){
with(_7b){
_7d=+_7d;
_7e=+_7e;
if(_7d===_7e){
return;
}
if(_dirtyTableColumnRangeIndex<0){
_dirtyTableColumnRangeIndex=MIN(_7d,_7e);
}else{
_dirtyTableColumnRangeIndex=MIN(_7d,_7e,_dirtyTableColumnRangeIndex);
}
if(_7e>_7d){
--_7e;
}
var _7f=_tableColumns[_7d];
objj_msgSend(_tableColumns,"removeObjectAtIndex:",_7d);
objj_msgSend(_tableColumns,"insertObject:atIndex:",_7f,_7e);
objj_msgSend(_7b,"setNeedsLayout");
}
}),new objj_method(sel_getUid("tableColumns"),function(_80,_81){
with(_80){
return _tableColumns;
}
}),new objj_method(sel_getUid("columnWithIdentifier:"),function(_82,_83,_84){
with(_82){
var _85=0,_86=(_tableColumns.length);
for(;_85<_86;++_85){
if(objj_msgSend(_tableColumns[_85],"identifier")===_84){
return _85;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("tableColumnWithIdentifier:"),function(_87,_88,_89){
with(_87){
var _8a=objj_msgSend(_87,"columnWithIdentifier:",_89);
if(_8a===CPNotFound){
return nil;
}
return _tableColumns[_8a];
}
}),new objj_method(sel_getUid("selectColumnIndexes:byExtendingSelection:"),function(_8b,_8c,_8d,_8e){
with(_8b){
_selectedRowIndexes=objj_msgSend(CPIndexSet,"indexSet");
if(_8e){
objj_msgSend(_selectedColumnIndexes,"addIndexes:",_8d);
}else{
_selectedColumnIndexes=objj_msgSend(_8d,"copy");
}
objj_msgSend(_8b,"setNeedsLayout");
}
}),new objj_method(sel_getUid("selectRowIndexes:byExtendingSelection:"),function(_8f,_90,_91,_92){
with(_8f){
_selectedColumnIndexes=objj_msgSend(CPIndexSet,"indexSet");
if(_92){
objj_msgSend(_selectedRowIndexes,"addIndexes:",_91);
}else{
_selectedRowIndexes=objj_msgSend(_91,"copy");
}
objj_msgSend(_8f,"setNeedsLayout");
}
}),new objj_method(sel_getUid("selectedColumnIndexes"),function(_93,_94){
with(_93){
return _selectedColumnIndexes;
}
}),new objj_method(sel_getUid("selectedRowIndexes"),function(_95,_96){
with(_95){
return _selectedRowIndexes;
}
}),new objj_method(sel_getUid("deselectColumn:"),function(_97,_98,_99){
with(_97){
objj_msgSend(_selectedColumnIndexes,"removeIndex:",_99);
}
}),new objj_method(sel_getUid("deselectRow:"),function(_9a,_9b,_9c){
with(_9a){
objj_msgSend(_selectedRowIndexes,"removeIndex:",_9c);
}
}),new objj_method(sel_getUid("numberOfSelectedColumns"),function(_9d,_9e){
with(_9d){
return objj_msgSend(_selectedColumnIndexes,"count");
}
}),new objj_method(sel_getUid("numberOfSelectedRows"),function(_9f,_a0){
with(_9f){
return objj_msgSend(_selectedRowIndexes,"count");
}
}),new objj_method(sel_getUid("isColumnSelected:"),function(_a1,_a2,_a3){
with(_a1){
return objj_msgSend(_selectedColumnIndexes,"containsIndex:",_a3);
}
}),new objj_method(sel_getUid("isRowSelected:"),function(_a4,_a5,_a6){
with(_a4){
return objj_msgSend(_selectedRowIndexes,"containsIndex:",_a6);
}
}),new objj_method(sel_getUid("numberOfColumns"),function(_a7,_a8){
with(_a7){
return (_tableColumns.length);
}
}),new objj_method(sel_getUid("numberOfRows"),function(_a9,_aa){
with(_a9){
if(!_dataSource){
return 0;
}
return objj_msgSend(_dataSource,"numberOfRowsInTableView:",_a9);
}
}),new objj_method(sel_getUid("cornerView"),function(_ab,_ac){
with(_ab){
return _cornerView;
}
}),new objj_method(sel_getUid("setCornerView:"),function(_ad,_ae,_af){
with(_ad){
_cornerView=_af;
}
}),new objj_method(sel_getUid("headerView"),function(_b0,_b1){
with(_b0){
return _headerView;
}
}),new objj_method(sel_getUid("setHeaderView:"),function(_b2,_b3,_b4){
with(_b2){
_headerView=_b4;
objj_msgSend(_headerView,"setTableView:",_b2);
}
}),new objj_method(sel_getUid("_recalculateTableColumnRanges"),function(_b5,_b6){
with(_b5){
if(_dirtyTableColumnRangeIndex<0){
return;
}
var _b7=_dirtyTableColumnRangeIndex,_b8=(_tableColumns.length),x=_b7===0?0:CPMaxRange(_tableColumnRanges[_b7-1]);
for(;_b7<_b8;++_b7){
var _ba=_tableColumns[_b7];
if(objj_msgSend(_ba,"isHidden")){
_tableColumnRanges[_b7]=CPMakeRange(x,0);
}else{
var _bb=objj_msgSend(_tableColumns[_b7],"width");
_tableColumnRanges[_b7]=CPMakeRange(x,_bb);
x+=_bb;
}
}
_tableColumnRanges.length=_b8;
_dirtyTableColumnRangeIndex=CPNotFound;
}
}),new objj_method(sel_getUid("rectOfColumn:"),function(_bc,_bd,_be){
with(_bc){
_be=+_be;
if(_be<0||_be>=(_tableColumns.length)){
return {origin:{x:0,y:0},size:{width:0,height:0}};
}
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(_bc,"_recalculateTableColumnRanges");
}
var _bf=_tableColumnRanges[_be];
return {origin:{x:_bf.location,y:0},size:{width:_bf.length,height:CGRectGetHeight(objj_msgSend(_bc,"bounds"))}};
}
}),new objj_method(sel_getUid("rectOfRow:"),function(_c0,_c1,_c2){
with(_c0){
if(NO){
return NULL;
}
return {origin:{x:0,y:(_c2*(_rowHeight+_intercellSpacing.height))},size:{width:(objj_msgSend(_c0,"bounds").size.width),height:_rowHeight}};
}
}),new objj_method(sel_getUid("rowsInRect:"),function(_c3,_c4,_c5){
with(_c3){
var _c6=nil,_c7=objj_msgSend(_c3,"rowAtPoint:",_c5.origin),_c8=objj_msgSend(_c3,"rowAtPoint:",{x:0,y:(_c5.origin.y+_c5.size.height)});
if(_c7<0){
_c6=objj_msgSend(_c3,"bounds");
if((_c5.origin.y)<(_c6.origin.y)){
_c7=0;
}else{
_c7=_numberOfRows-1;
}
}
if(_c8<0){
if(!_c6){
_c6=objj_msgSend(_c3,"bounds");
}
if((_c5.origin.y+_c5.size.height)<(_c6.origin.y)){
_c8=0;
}else{
_c8=_numberOfRows-1;
}
}
return CPMakeRange(_c7,_c8-_c7+1);
}
}),new objj_method(sel_getUid("columnIndexesInRect:"),function(_c9,_ca,_cb){
with(_c9){
var _cc=MAX(0,objj_msgSend(_c9,"columnAtPoint:",{x:_cb.origin.x,y:0})),_cd=objj_msgSend(_c9,"columnAtPoint:",{x:(_cb.origin.x+_cb.size.width),y:0});
if(_cd===CPNotFound){
_cd=(_tableColumns.length)-1;
}
if(_numberOfHiddenColumns<=0){
return objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(_cc,_cd-_cc+1));
}
var _ce=objj_msgSend(CPIndexSet,"indexSet");
for(;_cc<=_cd;++_cc){
var _cf=_tableColumns[_cc];
if(!objj_msgSend(_cf,"isHidden")){
objj_msgSend(_ce,"addIndex:",_cc);
}
}
return _ce;
}
}),new objj_method(sel_getUid("columnAtPoint:"),function(_d0,_d1,_d2){
with(_d0){
var _d3=objj_msgSend(_d0,"bounds");
if(!(_d2.x>=(_d3.origin.x)&&_d2.y>=(_d3.origin.y)&&_d2.x<(_d3.origin.x+_d3.size.width)&&_d2.y<(_d3.origin.y+_d3.size.height))){
return CPNotFound;
}
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(_d0,"_recalculateTableColumnRanges");
}
var x=_d2.x,low=0,_d6=_tableColumnRanges.length-1;
while(low<=_d6){
var _d7=FLOOR(low+(_d6-low)/2),_d8=_tableColumnRanges[_d7];
if(x<_d8.location){
_d6=_d7-1;
}else{
if(x>=CPMaxRange(_d8)){
low=_d7+1;
}else{
var _d9=_tableColumnRanges.length;
while(_d7<_d9&&objj_msgSend(_tableColumns[_d7],"isHidden")){
++_d7;
}
if(_d7<_d9){
return _d7;
}
return CPNotFound;
}
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("rowAtPoint:"),function(_da,_db,_dc){
with(_da){
var y=_dc.y;
if(NO){
}
var row=FLOOR(y/(_rowHeight+_intercellSpacing.height));
if(row>=_numberOfRows){
return -1;
}
return row;
}
}),new objj_method(sel_getUid("frameOfDataViewAtColumn:row:"),function(_df,_e0,_e1,_e2){
with(_df){
var _e3=_tableColumns[_e1],_e4=objj_msgSend(_df,"rectOfRow:",_e2);
return {origin:{x:_e3.location,y:(_e4.origin.y)},size:{width:_e3.length,height:(_e4.size.height)}};
}
}),new objj_method(sel_getUid("sizeLastColumnToFit"),function(_e5,_e6){
with(_e5){
var _e7=objj_msgSend(_e5,"superview");
if(!_e7){
return;
}
var _e8=objj_msgSend(_e7,"bounds").size;
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(_e5,"_recalculateTableColumnRanges");
}
var _e9=(_tableColumns.length);
while(_e9--&&objj_msgSend(_tableColumns[_e9],"isHidden")){
}
if(_e9>=0){
objj_msgSend(_tableColumns[_e9],"setWidth:",MAX(0,_e8.width-(objj_msgSend(_e5,"rectOfColumn:",_e9).origin.x)));
}
objj_msgSend(_e5,"setNeedsLayout");
}
}),new objj_method(sel_getUid("noteNumberOfRowsChanged"),function(_ea,_eb){
with(_ea){
_numberOfRows=objj_msgSend(_dataSource,"numberOfRowsInTableView:",_ea);
objj_msgSend(_ea,"setNeedsLayout");
}
}),new objj_method(sel_getUid("_sizeToParent"),function(_ec,_ed){
with(_ec){
var _ee=objj_msgSend(objj_msgSend(_ec,"superview"),"bounds").size;
if(_dirtyTableColumnRangeIndex!==CPNotFound){
objj_msgSend(_ec,"_recalculateTableColumnRanges");
}
if(_tableColumnRanges.length>0){
var _ef=CPMaxRange(objj_msgSend(_tableColumnRanges,"lastObject"));
}else{
var _ef=0;
}
objj_msgSend(_ec,"setFrameSize:",{width:MAX(_ee.width,_ef),height:MAX(_ee.height,(_rowHeight+_intercellSpacing.height)*_numberOfRows)});
}
}),new objj_method(sel_getUid("setDelegate:"),function(_f0,_f1,_f2){
with(_f0){
if(_delegate===_f2){
return;
}
var _f3=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_delegate){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidMove:"))){
objj_msgSend(_f3,"removeObserver:name:object:",_delegate,CPTableViewColumnDidMoveNotification,_f0);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidResize:"))){
objj_msgSend(_f3,"removeObserver:name:object:",_delegate,CPTableViewColumnDidResizeNotification,_f0);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionDidChange:"))){
objj_msgSend(_f3,"removeObserver:name:object:",_delegate,CPTableViewSelectionDidChangeNotification,_f0);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionIsChanging:"))){
objj_msgSend(_f3,"removeObserver:name:object:",_delegate,CPTableViewSelectionIsChangingNotification,_f0);
}
}
_delegate=_f2;
_implementedDelegateMethods=0;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("selectionShouldChangeInTableView:"))){
_implementedDelegateMethods|=_7;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:dataViewForTableColumn:row:"))){
_implementedDelegateMethods|=_8;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:didClickTableColumn:"))){
_implementedDelegateMethods|=_9;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:didDragTableColumn:"))){
_implementedDelegateMethods|=_a;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:heightOfRow:"))){
_implementedDelegateMethods|=_b;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:isGroupRow:"))){
_implementedDelegateMethods|=_c;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:mouseDownInHeaderOfTableColumn:"))){
_implementedDelegateMethods|=_d;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:nextTypeSelectMatchFromRow:toRow:forString:"))){
_implementedDelegateMethods|=_e;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:selectionIndexesForProposedSelection:"))){
_implementedDelegateMethods|=_f;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldEditTableColumn:row:"))){
_implementedDelegateMethods|=_10;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldSelectRow:"))){
_implementedDelegateMethods|=_11;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldSelectTableColumn:"))){
_implementedDelegateMethods|=_12;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldShowViewExpansionForTableColumn:row:"))){
_implementedDelegateMethods|=_13;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldTrackView:forTableColumn:row:"))){
_implementedDelegateMethods|=_14;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:shouldTypeSelectForEvent:withCurrentSearchString:"))){
_implementedDelegateMethods|=_15;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:toolTipForView:rect:tableColumn:row:mouseLocation:"))){
_implementedDelegateMethods|=_16;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:typeSelectStringForTableColumn:row:"))){
_implementedDelegateMethods|=_17;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableView:willDisplayView:forTableColumn:row:"))){
_implementedDelegateMethods|=_18;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidMove:"))){
objj_msgSend(_f3,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewColumnDidMove:"),CPTableViewColumnDidMoveNotification,_f0);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewColumnDidResize:"))){
objj_msgSend(_f3,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewColumnDidMove:"),CPTableViewColumnDidResizeNotification,_f0);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionDidChange:"))){
objj_msgSend(_f3,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewSelectionDidChange:"),CPTableViewSelectionDidChangeNotification,_f0);
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("tableViewSelectionIsChanging:"))){
objj_msgSend(_f3,"addObserver:selector:name:object:",_delegate,sel_getUid("tableViewSelectionIsChanging:"),CPTableViewSelectionIsChangingNotification,_f0);
}
}
}),new objj_method(sel_getUid("delegate"),function(_f4,_f5){
with(_f4){
return _delegate;
}
}),new objj_method(sel_getUid("_objectValueForTableColumn:row:"),function(_f6,_f7,_f8,_f9){
with(_f6){
var _fa=objj_msgSend(_f8,"UID"),_fb=_objectValues[_fa];
if(!_fb){
_fb=[];
_objectValues[_fa]=_fb;
}
var _fc=_fb[_f9];
if(_fc===undefined){
_fc=objj_msgSend(_dataSource,"tableView:objectValueForTableColumn:row:",_f6,_f8,_f9);
_fb[_f9]=_fc;
}
return _fc;
}
}),new objj_method(sel_getUid("_exposedRect"),function(_fd,_fe){
with(_fd){
var _ff=objj_msgSend(_fd,"superview");
if(!objj_msgSend(_ff,"isKindOfClass:",objj_msgSend(CPClipView,"class"))){
return objj_msgSend(_fd,"bounds");
}
return objj_msgSend(_fd,"convertRect:fromView:",CGRectIntersection(objj_msgSend(_ff,"bounds"),objj_msgSend(_fd,"frame")),_ff);
}
}),new objj_method(sel_getUid("load"),function(self,_cmd){
with(self){
if(!_dataSource){
return;
}
var _102=objj_msgSend(self,"_exposedRect"),_103=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",objj_msgSend(self,"rowsInRect:",_102)),_104=objj_msgSend(self,"columnIndexesInRect:",_102),_105=objj_msgSend(_exposedRows,"copy"),_106=objj_msgSend(_exposedColumns,"copy");
objj_msgSend(_105,"removeIndexes:",_103);
objj_msgSend(_106,"removeIndexes:",_104);
var _107=objj_msgSend(_103,"copy"),_108=objj_msgSend(_104,"copy");
objj_msgSend(_107,"removeIndexes:",_exposedRows);
objj_msgSend(_108,"removeIndexes:",_exposedColumns);
var _109=objj_msgSend(_103,"copy"),_10a=objj_msgSend(_104,"copy");
objj_msgSend(_109,"removeIndexes:",_107);
objj_msgSend(_10a,"removeIndexes:",_108);
objj_msgSend(self,"_unloadDataViewsInRows:columns:",_109,_106);
objj_msgSend(self,"_unloadDataViewsInRows:columns:",_105,_10a);
objj_msgSend(self,"_unloadDataViewsInRows:columns:",_105,_106);
objj_msgSend(self,"_loadDataViewsInRows:columns:",_109,_108);
objj_msgSend(self,"_loadDataViewsInRows:columns:",_107,_10a);
objj_msgSend(self,"_loadDataViewsInRows:columns:",_107,_108);
_exposedRows=_103;
_exposedColumns=_104;
objj_msgSend(_tableDrawView,"setFrame:",_102);
objj_msgSend(_tableDrawView,"display");
}
}),new objj_method(sel_getUid("_unloadDataViewsInRows:columns:"),function(self,_cmd,rows,_10e){
with(self){
if(!objj_msgSend(rows,"count")||!objj_msgSend(_10e,"count")){
return;
}
var _10f=[],_110=[];
objj_msgSend(rows,"getIndexes:maxCount:inIndexRange:",_10f,-1,nil);
objj_msgSend(_10e,"getIndexes:maxCount:inIndexRange:",_110,-1,nil);
var _111=0,_112=_110.length;
for(;_111<_112;++_111){
var _113=_110[_111],_114=_tableColumns[_113],_115=objj_msgSend(_114,"UID");
var _116=0,_117=_10f.length;
for(;_116<_117;++_116){
var row=_10f[_116],_119=_dataViewsForTableColumns[_115][row];
_dataViewsForTableColumns[_115][row]=nil;
if(!_cachedDataViews[_119.identifier]){
_cachedDataViews[_119.identifier]=[_119];
}else{
_cachedDataViews[_119.identifier].push(_119);
}
}
}
}
}),new objj_method(sel_getUid("_loadDataViewsInRows:columns:"),function(self,_cmd,rows,_11d){
with(self){
if(!objj_msgSend(rows,"count")||!objj_msgSend(_11d,"count")){
return;
}
var _11e=[],_11f=[],_120=[];
objj_msgSend(rows,"getIndexes:maxCount:inIndexRange:",_11e,-1,nil);
objj_msgSend(_11d,"getIndexes:maxCount:inIndexRange:",_120,-1,nil);
var _121=0,_122=_120.length;
for(;_121<_122;++_121){
var _123=_120[_121],_124=_tableColumns[_123],_125=objj_msgSend(_124,"UID"),_126=_tableColumnRanges[_123];
if(!_dataViewsForTableColumns[_125]){
_dataViewsForTableColumns[_125]=[];
}
var _127=0,_128=_11e.length;
for(;_127<_128;++_127){
var row=_11e[_127],_12a=objj_msgSend(_124,"_newDataViewForRow:",row),_12b=_11f[row];
if(!_12b){
_12b=_11f[row]=objj_msgSend(self,"rectOfRow:",row);
}
objj_msgSend(_12a,"setFrame:",{origin:{x:_126.location,y:(_12b.origin.y)},size:{width:_126.length,height:(_12b.size.height)}});
objj_msgSend(_12a,"setObjectValue:",objj_msgSend(self,"_objectValueForTableColumn:row:",_124,row));
if(objj_msgSend(_12a,"superview")!==self){
objj_msgSend(self,"addSubview:",_12a);
}
_dataViewsForTableColumns[_125][row]=_12a;
}
}
}
}),new objj_method(sel_getUid("setFrameSize:"),function(self,_cmd,_12e){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPControl")},"setFrameSize:",_12e);
objj_msgSend(_headerView,"setFrameSize:",CGSizeMake(_12e.width,objj_msgSend(_headerView,"frame").size.height));
}
}),new objj_method(sel_getUid("exposedClipRect"),function(self,_cmd){
with(self){
var _131=objj_msgSend(self,"superview");
if(!objj_msgSend(_131,"isKindOfClass:",objj_msgSend(CPClipView,"class"))){
return objj_msgSend(self,"bounds");
}
return objj_msgSend(self,"convertRect:fromView:",CGRectIntersection(objj_msgSend(_131,"bounds"),objj_msgSend(self,"frame")),_131);
}
}),new objj_method(sel_getUid("_drawRect:"),function(self,_cmd,_134){
with(self){
var _135=objj_msgSend(self,"_exposedRect");
objj_msgSend(self,"drawBackgroundInClipRect:",_135);
objj_msgSend(self,"highlightSelectionInClipRect:",_135);
objj_msgSend(self,"drawGridInClipRect:",_135);
}
}),new objj_method(sel_getUid("drawBackgroundInClipRect:"),function(self,_cmd,_138){
with(self){
if(!objj_msgSend(self,"usesAlternatingRowBackgroundColors")){
return;
}
var _139=objj_msgSend(self,"alternatingRowBackgroundColors"),_13a=objj_msgSend(_139,"count");
if(_13a===0){
return;
}
var _13b=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
if(_13a===1){
CGContextSetFillColor(_13b,_139[0]);
CGContextFillRect(_13b,_138);
return;
}
var _13c=objj_msgSend(self,"rowsInRect:",_138),_13d=_13c.location,_13e=CPMaxRange(_13c)-1,_13f=MIN(_13c.length,_13a);
while(_13f--){
var row=_13d%_13a+_13d+_13f,_141=nil;
CGContextBeginPath(_13b);
for(;row<=_13e;row+=_13a){
CGContextAddRect(_13b,CGRectIntersection(_138,_141=objj_msgSend(self,"rectOfRow:",row)));
}
if(row-_13a===_13e){
heightFilled=(_141.origin.y+_141.size.height);
}
CGContextClosePath(_13b);
CGContextSetFillColor(_13b,_139[_13f]);
CGContextFillPath(_13b);
}
var _142=(_138.origin.y+_138.size.height);
if(heightFilled>=_142||_rowHeight<=0){
return;
}
var _143=_rowHeight+_intercellSpacing.height,_141={origin:{x:(_138.origin.x),y:(_138.origin.y)+heightFilled},size:{width:(_138.size.width),height:_143}};
for(row=_13e+1;heightFilled<_142;++row){
CGContextSetFillColor(_13b,_139[row%_13a]);
CGContextFillRect(_13b,_141);
heightFilled+=_143;
_141.origin.y+=_143;
}
}
}),new objj_method(sel_getUid("drawGridInClipRect:"),function(self,_cmd,_146){
with(self){
var _147=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_148=objj_msgSend(self,"gridStyleMask");
if(!(_148&(CPTableViewSolidHorizontalGridLineMask|CPTableViewSolidVerticalGridLineMask))){
return;
}
CGContextBeginPath(_147);
if(_148&CPTableViewSolidHorizontalGridLineMask){
var _149=objj_msgSend(self,"rowsInRect:",_146);
row=_149.location,lastRow=CPMaxRange(_149)-1,rowY=0,minX=(_146.origin.x),maxX=(_146.origin.x+_146.size.width);
for(;row<=lastRow;++row){
var _14b=objj_msgSend(self,"rectOfRow:",row),rowY=(_14b.origin.y+_14b.size.height)-0.5;
CGContextMoveToPoint(_147,minX,rowY);
CGContextAddLineToPoint(_147,maxX,rowY);
}
if(_rowHeight>0){
var _14c=_rowHeight+_intercellSpacing.height,_14d=(_146.origin.y+_146.size.height);
while(rowY<_14d){
rowY+=_14c;
CGContextMoveToPoint(_147,minX,rowY);
CGContextAddLineToPoint(_147,maxX,rowY);
}
}
}
if(_148&CPTableViewSolidVerticalGridLineMask){
var _14e=objj_msgSend(self,"columnIndexesInRect:",_146),_14f=[];
objj_msgSend(_14e,"getIndexes:maxCount:inIndexRange:",_14f,-1,nil);
var _150=0,_151=_14f.length,minY=(_146.origin.y),maxY=(_146.origin.y+_146.size.height);
for(;_150<_151;++_150){
var _154=objj_msgSend(self,"rectOfColumn:",_150),_155=(_154.origin.x+_154.size.width)-0.5;
CGContextMoveToPoint(_147,_155,minY);
CGContextAddLineToPoint(_147,_155,maxY);
}
}
CGContextClosePath(_147);
CGContextSetStrokeColor(_147,_gridColor);
CGContextStrokePath(_147);
}
}),new objj_method(sel_getUid("highlightSelectionInClipRect:"),function(self,_cmd,_158){
with(self){
if(objj_msgSend(self,"selectionHighlightStyle")===CPTableViewSelectionHighlightStyleSourceList){
objj_msgSend(objj_msgSend(CPColor,"selectionColorSourceView"),"setFill");
}else{
objj_msgSend(objj_msgSend(CPColor,"selectionColor"),"setFill");
}
var _159=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort"),_15a=[],_15b=sel_getUid("rectOfRow:");
if(objj_msgSend(_selectedRowIndexes,"count")>=1){
var _15c=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",objj_msgSend(self,"rowsInRect:",_158)),_15d=objj_msgSend(_15c,"firstIndex"),_15e=CPMakeRange(_15d,objj_msgSend(_15c,"lastIndex")-_15d+1);
objj_msgSend(_selectedRowIndexes,"getIndexes:maxCount:inIndexRange:",_15a,-1,_15e);
}else{
if(objj_msgSend(_selectedColumnIndexes,"count")>=1){
_15b=sel_getUid("rectOfColumn:");
var _15f=objj_msgSend(self,"columnIndexesInRect:",_158),_160=objj_msgSend(_15f,"firstIndex"),_15e=CPMakeRange(_160,objj_msgSend(_15f,"lastIndex")-_160+1);
objj_msgSend(_selectedColumnIndexes,"getIndexes:maxCount:inIndexRange:",_15a,-1,_15e);
}
}
var _161=objj_msgSend(_15a,"count");
if(!_161){
return;
}
CGContextBeginPath(_159);
while(_161--){
CGContextAddRect(_159,CGRectIntersection(objj_msgSend(self,_15b,_15a[_161]),_158));
}
CGContextClosePath(_159);
CGContextFillPath(_159);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(self,_cmd){
with(self){
objj_msgSend(self,"load");
}
}),new objj_method(sel_getUid("viewWillMoveToSuperview:"),function(self,_cmd,_166){
with(self){
var _167=objj_msgSend(self,"superview"),_168=objj_msgSend(CPNotificationCenter,"defaultCenter");
if(_167){
objj_msgSend(_168,"removeObserver:name:object:",self,CPViewFrameDidChangeNotification,_167);
objj_msgSend(_168,"removeObserver:name:object:",self,CPViewBoundsDidChangeNotification,_167);
}
if(_166){
objj_msgSend(_166,"setPostsFrameChangedNotifications:",YES);
objj_msgSend(_166,"setPostsBoundsChangedNotifications:",YES);
objj_msgSend(_168,"addObserver:selector:name:object:",self,sel_getUid("superviewFrameChanged:"),CPViewFrameDidChangeNotification,_166);
objj_msgSend(_168,"addObserver:selector:name:object:",self,sel_getUid("superviewBoundsChanged:"),CPViewBoundsDidChangeNotification,_166);
}
}
}),new objj_method(sel_getUid("superviewBoundsChanged:"),function(self,_cmd,_16b){
with(self){
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("superviewFrameChanged:"),function(self,_cmd,_16e){
with(self){
objj_msgSend(self,"_sizeToParent");
objj_msgSend(self,"setNeedsDisplay:",YES);
objj_msgSend(self,"setNeedsLayout");
}
}),new objj_method(sel_getUid("tracksMouseOutsideOfFrame"),function(self,_cmd){
with(self){
return YES;
}
}),new objj_method(sel_getUid("startTrackingAt:"),function(self,_cmd,_173){
with(self){
var row=objj_msgSend(self,"rowAtPoint:",_173);
if(objj_msgSend(self,"mouseDownFlags")&CPShiftKeyMask){
_selectionAnchorRow=(ABS(objj_msgSend(_selectedRowIndexes,"firstIndex")-row)<ABS(objj_msgSend(_selectedRowIndexes,"lastIndex")-row))?objj_msgSend(_selectedRowIndexes,"firstIndex"):objj_msgSend(_selectedRowIndexes,"lastIndex");
}else{
_selectionAnchorRow=row;
}
objj_msgSend(self,"_updateSelectionWithMouseAtRow:",row);
return YES;
}
}),new objj_method(sel_getUid("continueTracking:at:"),function(self,_cmd,_177,_178){
with(self){
objj_msgSend(self,"_updateSelectionWithMouseAtRow:",objj_msgSend(self,"rowAtPoint:",_178));
return YES;
}
}),new objj_method(sel_getUid("stopTracking:at:mouseIsUp:"),function(self,_cmd,_17b,_17c,_17d){
with(self){
}
}),new objj_method(sel_getUid("_updateSelectionWithMouseAtRow:"),function(self,_cmd,aRow){
with(self){
if(objj_msgSend(self,"mouseDownFlags")&(CPCommandKeyMask|CPControlKeyMask|CPAlternateKeyMask)){
if(objj_msgSend(_selectedRowIndexes,"containsIndex:",aRow)){
newSelection=objj_msgSend(_selectedRowIndexes,"copy");
objj_msgSend(newSelection,"removeIndex:",aRow);
}else{
if(_allowsMultipleSelection){
newSelection=objj_msgSend(_selectedRowIndexes,"copy");
objj_msgSend(newSelection,"addIndex:",aRow);
}else{
newSelection=objj_msgSend(CPIndexSet,"indexSetWithIndex:",aRow);
}
}
}else{
if(_allowsMultipleSelection){
newSelection=objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(MIN(aRow,_selectionAnchorRow),ABS(aRow-_selectionAnchorRow)+1));
}else{
if(aRow>=0&&aRow<_numberOfRows){
newSelection=objj_msgSend(CPIndexSet,"indexSetWithIndex:",aRow);
}else{
newSelection=objj_msgSend(CPIndexSet,"indexSet");
}
}
}
if(objj_msgSend(newSelection,"isEqualToIndexSet:",_selectedRowIndexes)){
return;
}
if(_implementedDelegateMethods&_7&&!objj_msgSend(_delegate,"selectionShouldChangeInTableView:",self)){
return;
}
if(_implementedDelegateMethods&_f){
newSelection=objj_msgSend(_delegate,"tableView:selectionIndexesForProposedSelection:",self,newSelection);
}
if(_implementedDelegateMethods&_11){
var _181=[];
objj_msgSend(newSelection,"getIndexes:maxCount:inIndexRange:",_181,-1,nil);
var _182=_181.length;
while(_182--){
var _183=_181[_182];
if(!objj_msgSend(_delegate,"tableView:shouldSelectRow:",self,_183)){
objj_msgSend(newSelection,"removeIndex:",_183);
}
}
}
if(!_allowsEmptySelection&&objj_msgSend(newSelection,"count")===0){
return;
}
if(objj_msgSend(newSelection,"isEqualToIndexSet:",_selectedRowIndexes)){
return;
}
objj_msgSend(self,"selectRowIndexes:byExtendingSelection:",newSelection,NO);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPTableViewSelectionIsChangingNotification,self,nil);
}
})]);
var _184="CPTableViewDataSourceKey",_185="CPTableViewDelegateKey",_186="CPTableViewHeaderViewKey",_187="CPTableViewTableColumnsKey",_188="CPTableViewRowHeightKey",_189="CPTableViewIntercellSpacingKey",_18a="CPTableViewMultipleSelectionKey",_18b="CPTableViewEmptySelectionKey";
var _1b=objj_getClass("CPTableView");
if(!_1b){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPTableView\""));
}
var _1c=_1b.isa;
class_addMethods(_1b,[new objj_method(sel_getUid("initWithCoder:"),function(self,_cmd,_18e){
with(self){
objj_msgSend(self,"init");
self=objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPControl")},"initWithCoder:",_18e);
if(self){
_dataSource=objj_msgSend(_18e,"decodeObjectForKey:",_184);
_delegate=objj_msgSend(_18e,"decodeObjectForKey:",_185);
_rowHeight=objj_msgSend(_18e,"decodeFloatForKey:",_188);
_intercellSpacing=objj_msgSend(_18e,"decodeSizeForKey:",_189);
_allowsMultipleSelection=objj_msgSend(_18e,"decodeBoolForKey:",_18a);
_allowsEmptySelection=objj_msgSend(_18e,"decodeBoolForKey:",_18b);
_tableColumns=objj_msgSend(_18e,"decodeObjectForKey:",_187);
objj_msgSend(_tableColumns,"makeObjectsPerformSelector:withObject:",sel_getUid("setTableView:"),self);
_dirtyTableColumnRangeIndex=0;
objj_msgSend(self,"viewWillMoveToSuperview:",objj_msgSend(self,"superview"));
}
return self;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(self,_cmd,_191){
with(self){
objj_msgSendSuper({receiver:self,super_class:objj_getClass("CPControl")},"encodeWithCoder:",_191);
objj_msgSend(_191,"encodeObject:forKey:",_dataSource,_184);
objj_msgSend(_191,"encodeObject:forKey:",_delegate,_185);
objj_msgSend(_191,"encodeFloat:forKey:",_rowHeight,_188);
objj_msgSend(_191,"encodeSize:forKey:",_intercellSpacing,_189);
objj_msgSend(_191,"encodeBool:forKey:",_allowsMultipleSelection,_18a);
objj_msgSend(_191,"encodeBool:forKey:",_allowsEmptySelection,_18b);
objj_msgSend(_191,"encodeObject:forKey:",_tableColumns,_187);
}
})]);
var _1b=objj_getClass("CPColor");
if(!_1b){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPColor\""));
}
var _1c=_1b.isa;
class_addMethods(_1c,[new objj_method(sel_getUid("selectionColor"),function(self,_cmd){
with(self){
return objj_msgSend(CPColor,"colorWithHexString:","5f83b9");
}
}),new objj_method(sel_getUid("selectionColorSourceView"),function(self,_cmd){
with(self){
return objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:","Resources/tableviewselection.png",CGSizeMake(6,22)));
}
})]);
