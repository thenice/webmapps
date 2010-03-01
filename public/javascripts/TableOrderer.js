// Copyright (c) 2007 Gregory SCHURGAST (http://www.negko.com, http://prototools.negko.com)
// 
// Permission is hereby granted, free of charge, to any person obtaining
// a copy of this software and associated documentation files (the
// "Software"), to deal in the Software without restriction, including
// without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Software, and to
// permit persons to whom the Software is furnished to do so, subject to
// the following conditions:
// 
// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
// LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
// OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
// WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
// VERSION 1.2

var TableOrderer = Class.create();
//defining the rest of the class implementation

TableOrderer.prototype = {
	initialize: function(element,options) {
		this.element = element;
		this.options = options;
		
		this.options = Object.extend({
			data: false, 				// array of data
			url: false, 				// url to a JSON application containing the data
			allowMultiselect : true, 	// don't work yet
			unsortedColumn : [],		// array of column you don't want to sort
			dateFormat : 'd', 			// d|m ; d => dd/mm/yyyy; m => mm/dd/yyyy
			filter : false,				// show Filter Option. false | 'top' | 'bottom'
			paginate : 5				// Number of item by table : (Not implemented yet)
			
		}, options || {});
		
		this.container = $(element);
		this.orderField = false;
		this.order = 'asc';	
		this.thClickbfx = this.thClick.bindAsEventListener(this);
		this.thOverbfx = this.thOver.bindAsEventListener(this);
		this.thOutbfx = this.thOut.bindAsEventListener(this);
		this.setData();
	},

	perform : function(){
		this.setColumnsName()
		this.createTable();
	},
	
	getData : function(url){
		new Ajax.Request(url,{
			onLoading : function(){ $(this.element).update('Loading...'); }.bind(this),
			onSuccess: function(transport) {
				this.data = transport.responseJSON;
				this.perform();
			}.bind(this),
			onFailure : function(){ alert('invalid data'); }
		});
	},
	
	setData : function(){
		if (!this.options.data && !this.options.url){alert('no data');}
		this.data = this.options.data ? this.options.data : false;
		this.data ? this.perform() : this.getData(this.options.url);
	},

	
	orderRule : function (s){
		var dateRE = /^(\d{2})[\/\- ](\d{2})[\/\- ](\d{4}|\d{2})/;
		var exp=new RegExp(dateRE);
		if ( exp.test(s) ){
			s = this.options.dateFormat == 'd' ? s.replace(dateRE,"$3$2$1") : s.replace(dateRE,"$3$1$2");
		}
		return s;
	},
	
	defineOrderField : function(e){
		this.previousOrderField = this.orderField; 
		this.orderField = Event.element(e).id.replace(this.table.id+'-','');
	},

	/*  if you click on a header for the first time order is ascending
	     else it switches between ascending and descending
	*/
	defineOrder : function(){ 
		if (this.previousOrderField == this.orderField){ this.order = this.order == 'desc' ? 'asc' : 'desc'; }
		else { this.order = 'asc'; }
	},
	
	/* Ordonne les données du tableau */
	orderData : function(order){
		var order = order;
		this.data = this.data.sortBy(function(s){
			v = Object.values(s)[Object.keys(s).indexOf(order)];
			return this.orderRule(v);
		}.bind(this));	
	},
	
	thClick : function(e){
		this.defineOrderField(e);
		this.defineOrder();
		this.orderData(this.orderField);
		this.createTable();
	},
	
	thOver : function(e){
		Event.element(e).addClassName('on');
	},
	thOut : function(e){
		Event.element(e).removeClassName('on');
	},
		
	trClick : function(e){
		this.setSelected(Event.findElement(e,'tr'));
		items = Event.findElement(e,'tr').descendants().pluck('innerHTML');
		var json = '{';
		var keys  = Object.keys(this.model);
		items.each(function(i,index){
			json += index == 0 ? '' : ', '; 
			json += '"'+keys[index]+'": "'+i+'"';
		});
		json += '}';
		selected = json.evalJSON();
		//if (Prototype.Browser.Gecko){console.log(json);}
	},
	
	trOver : function(e){
		Event.findElement(e,'tr').addClassName('on');
	},
	
	trOut : function(e){
		Event.findElement(e,'tr').removeClassName('on');
	},
	
	setSelected : function(elt){
		if (this.options.allowMultiselect){
			elt.hasClassName('selected') ? elt.removeClassName('selected') : elt.addClassName('selected');
		}
		else{
		/* */
		}
	},

	/*Ajoute les observer */
	addObserver : function(){
		tid = this.table.id;
		$$('#'+tid+' th')
			.invoke('observe','click',this.thClickbfx)
			.invoke('observe','mouseover',this.thOverbfx)
			.invoke('observe','mouseout',this.thOutbfx);
		
		$$('#'+tid+' tr.data')
			.invoke('observe','click',this.trClick.bindAsEventListener(this))
			.invoke('observe','mouseover',this.trOver.bindAsEventListener(this))
			.invoke('observe','mouseout',this.trOut.bindAsEventListener(this));
		
		if (this.options.filter){
			var filterDatakbfx = this.filterData.bindAsEventListener(this);
			Event.observe(tid+'-filter-column','change',filterDatakbfx);
			Event.observe(tid+'-filter-data','keyup',filterDatakbfx);
		}
	},
	
	filterData : function(e){
		var tid = this.table.id;
			$$('#'+tid+' td.' + tid+'-column-'+$F(tid + '-filter-column')).each(function(i){
				i.ancestors()[1].show();
				if(!i.innerHTML.toUpperCase().include($F(tid + '-filter-data').toUpperCase())){
					i.ancestors()[1].hide();
				}
			});
	},

	makeColumnUnsortable : function(columnId){
		columnId = this.table.id + '-' + columnId;
		$(columnId).setStyle({'backgroundImage' : 'none'});
		Event.stopObserving($(columnId),'click', this.thClickbfx);
		Event.stopObserving($(columnId),'mouseover', this.thOverbfx);
		Event.stopObserving($(columnId),'mouseout', this.thOutbfx);
	},
	
	makeUnsort : function(){
		this.options.unsortedColumn.each(function(i){
			if($(this.table.id + '-' + i)){ this.makeColumnUnsortable(i);}
		}.bind(this));
	},
	
	createTable : function(){
		this.container.update();
		this.container.insert({ top: '<table cellspacing="1" cellpadding="0" id="data-grid-'+this.element+'" class="prototools-table"></table>' });
		this.table = $('data-grid-'+this.element);
		this.createRows();
		this.addObserver();
		this.makeUnsort();
	},
	
	createRow : function(obj,index){
		line = index%2;
		var row = '<tr class="data line'+line+'" id="'+this.table.id+'-'+index+'">\n';
		var obj = obj;
		var values = Object.values(obj);
		this.tableColumnsName.each(function(s,index){
			row += '\t<td class="'+this.table.id+'-column-'+s+'">'+values[index]+'</td>\n';
		}.bind(this));
		row += '\n</tr>';
		return row;
	},
	
	createFirstRow : function(obj){
		row = '<tr>\n';
		this.tableColumnsName.each(function(i){
			row += '\t<th id="'+this.table.id+'-'+i+'">'+i.replace('_',' ').capitalize()+'</th>';
		}.bind(this));
		row += '\n</tr>';
		this.model = Object.clone(obj);
		return row;
	},
	
	setColumnsName : function(){
		this.tableColumnsName = Object.keys(this.data[0]);
	},
	
	createFilter : function(){
		var option = '';
		this.tableColumnsName.each(function(i){
			option += '\t<option value="'+i+'">'+i.replace('_',' ').capitalize()+'</option>\n';
		});
		$(this.table.id+'-options').insert({bottom : 'Filter Column :'})
		.insert({bottom : '<select id="'+this.table.id+'-filter-column">'+option+'</select>'})
		.insert({bottom : Element('input',{'id' : this.table.id+'-filter-data'})});
	},
	
	createRows : function(){
		var line = 1;
		if (this.order == 'desc'){ this.data = this.data.reverse(); }

		this.data.each(function(i,index){
			this.table.insert({ bottom: this.createRow(i,index) });
			line = (line == 1) ?  2 : 1;
		}.bind(this));

		this.table.insert({ top: this.createFirstRow() });	
		
		if (this.options.filter || this.options.paginate) { 
			filterDiv = new Element('div' , {'id' : this.table.id+'-options' , 'class':'prototools-options'});
			if (this.options.filter) {
				if (this.options.filter == 'top'){
					this.table.insert({ before :  filterDiv});
					filterDiv.setStyle('border-bottom : none;');
				}
				else {
					this.table.insert({ after :  filterDiv});
					filterDiv.setStyle('border-top : none;');
				}
				this.createFilter(); 
			}
		}
		if (this.orderField){ $( this.table.id+'-'+this.orderField).addClassName(this.order); }
	}
};