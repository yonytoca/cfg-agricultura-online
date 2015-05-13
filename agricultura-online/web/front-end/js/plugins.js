
var Plugins = function() {

	"use strict";

	/**
	 * $.browser for jQuery 1.9
	 */
	var initBrowserDetection = function() {
		$.browser={};(function(){$.browser.msie=false;
		$.browser.version=0;if(navigator.userAgent.match(/MSIE ([0-9]+)\./)){
		$.browser.msie=true;$.browser.version=RegExp.$1;}})();
	}

	/**
	 * Daterangepicker
	 */
	var initDaterangepicker = function() {
		if ($.fn.daterangepicker) {
			$('.range').daterangepicker({
				startDate: moment().subtract('days', 29),
				endDate: moment(),
				minDate: '01/01/2012',
				maxDate: '12/31/2014',
				dateLimit: { days: 60 },
				showDropdowns: true,
				showWeekNumbers: true,
				timePicker: false,
				timePickerIncrement: 1,
				timePicker12Hour: true,
				ranges: {
				   'Today': [moment(), moment()],
				   'Yesterday': [moment().subtract('days', 1), moment().subtract('days', 1)],
				   'Last 7 Days': [moment().subtract('days', 6), moment()],
				   'Last 30 Days': [moment().subtract('days', 29), moment()],
				   'This Month': [moment().startOf('month'), moment().endOf('month')],
				   'Last Month': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')]
				},
				opens: 'left',
				buttonClasses: ['btn btn-default'],
				applyClass: 'btn-sm btn-primary',
				cancelClass: 'btn-sm',
				format: 'MM/DD/YYYY',
				separator: ' to ',
				locale: {
					applyLabel: 'Submit',
					fromLabel: 'From',
					toLabel: 'To',
					customRangeLabel: 'Custom Range',
					daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr','Sa'],
					monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
					firstDay: 1
				}
			},

			function (start, end) {
				var range_updated = start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY');

				App.blockUI($("#content"));
				setTimeout(function () {
					App.unblockUI($("#content"));
					noty({
						text: '<strong>Dashboard updated to ' + range_updated + '.</strong>',
						type: 'success',
						timeout: 1000
					});
					//App.scrollTo();
				}, 1000);

				$('.range span').html(range_updated);
			});

			$('.range span').html(moment().subtract('days', 29).format('MMMM D, YYYY') + ' - ' + moment().format('MMMM D, YYYY'));
		}
	}

	/**
	 * Sparklines
	 */
	var initSparklines = function() {
		if ($.fn.sparkline) {
			// Set default options
			$.extend(true, $.fn.sparkline.defaults, {
				line: {
					highlightSpotColor: App.getLayoutColorCode('green'),
					highlightLineColor: App.getLayoutColorCode('red')
				},
				bar: {
					barColor: App.getLayoutColorCode('blue'),
					negBarColor: App.getLayoutColorCode('red'),
					barWidth: 5,
					barSpacing: 2
				},
				tristate: {
					posBarColor: App.getLayoutColorCode('green'),
					negBarColor: App.getLayoutColorCode('red')
				},
				box: {
					medianColor: App.getLayoutColorCode('red')
				}
			});

			$(window).resize(function () {
				$.sparkline_display_visible();
			}).resize();

			// Initialize statbox sparklines
			$('.statbox-sparkline').each(function () {
				$(this).sparkline('html', Plugins.getSparklineStatboxDefaults());
			})
		}
	}

	/**************************
	 * Tooltips               *
	 **************************/
	var initTooltips = function() {
		// Set default options

		// TODO: $.extend does not work since BS3!

		// This fixes issue #5865
		// (When using tooltips and popovers with the Bootstrap input groups,
		// you'll have to set the container option to avoid unwanted side effects.)
		$.extend(true, $.fn.tooltip.defaults, {
			container: 'body'
		});

		// Use e.g. "#container" as container (instead of "body")
		// if you're experience errors when using Ajax
		$('.bs-tooltip').tooltip({
			container: 'body'
		});
		$('.bs-focus-tooltip').tooltip({
			trigger: 'focus',
			container: 'body'
		});
	}

	/**************************
	 * Popovers               *
	 **************************/
	var initPopovers = function() {
		$('.bs-popover').popover();
	}

	/**************************
	 * Noty                   *
	 **************************/
	var initNoty = function() {
		if ($.noty) {
			// Set default options
			$.extend(true, $.noty.defaults, {
				type: 'alert',
				timeout: false,
				maxVisible: 5,
				animation: {
					open: {
						height:'toggle'
					},
					close: {
						height:'toggle'
					},
					easing: 'swing',
					speed: 200
				}
			});
		}
	}

	/**************************
	 * Easy Pie Chart         *
	 **************************/
	var initCircularCharts = function() {
		if ($.easyPieChart) {
			// Set default options
			$.extend(true, $.easyPieChart.defaultOptions, {
				lineCap: 'butt',
				animate: 500,
				barColor: App.getLayoutColorCode('blue')
			});

			// Initialize defaults
			$('.circular-chart').easyPieChart({
				size: 110,
				lineWidth: 10
			});
		}
	}

	/**************************
	 * DataTables             *
	 **************************/
	var initDataTables = function() {
		if ($.fn.dataTable) {
			// Set default options
			$.extend(true, $.fn.dataTable.defaults, {
				"oLanguage": {
					"sSearch": ""
				},
				"sDom": "<'row'<'dataTables_header clearfix'<'col-md-6'l><'col-md-6'f>r>>t<'row'<'dataTables_footer clearfix'<'col-md-6'i><'col-md-6'p>>>",
				// set the initial value
				"iDisplayLength": 5,
				fnDrawCallback: function () {
					if ($.fn.uniform) {
						$(':radio.uniform, :checkbox.uniform').uniform();
					}

					if ($.fn.select2) {
						$('.dataTables_length select').select2({
							minimumResultsForSearch: "-1"
						});
					}

					// SEARCH - Add the placeholder for Search and Turn this into in-line formcontrol
					var search_input = $(this).closest('.dataTables_wrapper').find('div[id$=_filter] input');

					// Only apply settings once
					if (search_input.parent().hasClass('input-group')) return;

					//search_input.attr('placeholder', 'Search')
					search_input.addClass('form-control')
					search_input.wrap('<div class="input-group"></div>');
					search_input.parent().prepend('<span class="input-group-addon"><i class="icon-search"></i></span>');
					//search_input.parent().prepend('<span class="input-group-addon"><i class="icon-search"></i></span>').css('width', '250px');

					// Responsive
					/*if (typeof responsiveHelper != 'undefined') {
						responsiveHelper.respond();
					}*/
				}
			});

			$.fn.dataTable.defaults.aLengthMenu = [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]];

			// Initialize default datatables
			$('.datatable').each(function () {
				var self = $(this);
				var options = {};

				/*
				 * Options via data-attribute
				 */

				// General Wrapper
				var data_dataTable = self.data('datatable');
				if (typeof data_dataTable != 'undefined') {
					$.extend(true, options, data_dataTable);
				}

				// Display Length
				var data_displayLength = self.data('displayLength');
				if (typeof data_displayLength != 'undefined') {
					$.extend(true, options, {
						"iDisplayLength": data_displayLength
					});
				}

				// Horizontal Scrolling
				var data_horizontalWidth = self.data('horizontalWidth');
				if (typeof data_horizontalWidth != 'undefined') {
					$.extend(true, options, {
						"sScrollX": "100%",
						"sScrollXInner": data_horizontalWidth,
						"bScrollCollapse": true
					});
				}

				/*
				 * Other
				 */

				// Checkable Tables
				if (self.hasClass('table-checkable')) {
					$.extend(true, options, {
						'aoColumnDefs': [
							{ 'bSortable': false, 'aTargets': [0] }
						]
					});
				}

				// TableTools
				if (self.hasClass('table-tabletools')) {
					$.extend(true, options, {
						"sDom": "<'row'<'dataTables_header clearfix'<'col-md-4'l><'col-md-8'Tf>r>>t<'row'<'dataTables_footer clearfix'<'col-md-6'i><'col-md-6'p>>>", // T is new
						"oTableTools": {
							"aButtons": [
								"copy",
								"print",
								"csv",
								"xls",
								"pdf"
							],
							"sSwfPath": "plugins/datatables/tabletools/swf/copy_csv_xls_pdf.swf"
						}
					});
				}

				// ColVis
				if (self.hasClass('table-colvis')) {
					$.extend(true, options, {
						"sDom": "<'row'<'dataTables_header clearfix'<'col-md-6'l><'col-md-6'Cf>r>>t<'row'<'dataTables_footer clearfix'<'col-md-6'i><'col-md-6'p>>>", // C is new
						"oColVis": {
							"buttonText": "Columns <i class='icon-angle-down'></i>",
							"iOverlayFade": 0
						}
					});
				}

				// TableTools and ColVis
				if (self.hasClass('table-tabletools') && self.hasClass('table-colvis')) {
					$.extend(true, options, {
						"sDom": "<'row'<'dataTables_header clearfix'<'col-md-6'l><'col-md-6'TCf>r>>t<'row'<'dataTables_footer clearfix'<'col-md-6'i><'col-md-6'p>>>", // C is new
					});
				}

				// If ColVis is used with checkable Tables
				if (self.hasClass('table-checkable') && self.hasClass('table-colvis')) {
					$.extend(true, options, {
						"oColVis": {
							"aiExclude": [0]
						}
					});
				}

				// Responsive Tables
				if (self.hasClass('table-responsive')) {
					var responsiveHelper;
					var breakpointDefinition = {
						tablet: 1024,
						phone: 480
					};

					// Preserve old function from $.extend above
					// to extend a function
					var old_fnDrawCallback = $.fn.dataTable.defaults.fnDrawCallback;

					$.extend(true, options, {
						bAutoWidth: false,
						fnPreDrawCallback: function () {
							// Initialize the responsive datatables helper once.
							if (!responsiveHelper) {
								responsiveHelper = new ResponsiveDatatablesHelper(this, breakpointDefinition);
							}
						},
						fnRowCallback: function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
							responsiveHelper.createExpandIcon(nRow);
						},
						fnDrawCallback: function (oSettings) {
							// Extending function
							old_fnDrawCallback.apply(this, oSettings);

							responsiveHelper.respond();
						}
					});
				}

				// Set options via external function
				var data_dataTableFunction = self.data('datatableFunction');
				if (typeof data_dataTableFunction != 'undefined') {
					$.extend(true, options, window[data_dataTableFunction]() );
				}

				// Check, if table should be initialized with a ColumnFilter
				if (self.hasClass('table-columnfilter')) {
					// With ColumnFilter

					var options_columnfilter = {};

					var data_columnFilter = self.data('columnfilter');
					if (typeof data_columnFilter != 'undefined') {
						$.extend(true, options_columnfilter, data_columnFilter);
					}

					$(this).dataTable(options).columnFilter(options_columnfilter);

					// Style inputs
					self.find('.filter_column').each(function() {
						// Check, if selectboxes should be converted into Select2s
						var data_columnFilterSelect2 = self.data('columnfilterSelect2');
						if (typeof data_columnFilterSelect2 != 'undefined') {
							$(this).children('input').addClass('form-control');

							$(this).children('select').addClass('full-width-fix').select2({
								placeholderOption: 'first',
								allowClear: true
							});
						} else {
							$(this).children('input, select').addClass('form-control');
						}
					});
				} else {
					// Without ColumnFilter (regular)
					$(this).dataTable(options);
				}
			});
		}
	}

	/**************************
	 * Flot Defaults          *
	 **************************/
	var defaultPlotOptions = {
		colors: [App.getLayoutColorCode('blue'), App.getLayoutColorCode('red'), App.getLayoutColorCode('green'), App.getLayoutColorCode('purple'), App.getLayoutColorCode('grey'), App.getLayoutColorCode('yellow')],
		legend: {
			show: true,
			labelBoxBorderColor: "", // border color for the little label boxes
			backgroundOpacity: 0.95 // set to 0 to avoid background
		},
		series: {
			points: {
				show: false,
				radius: 3,
				lineWidth: 2, // in pixels
				fill: true,
				fillColor: "#ffffff",
				symbol: "circle" // or callback
			},
			lines: {
				// we don't put in show: false so we can see
				// whether lines were actively disabled
				show: true,
				lineWidth: 2, // in pixels
				fill: false,
				fillColor: { colors: [ { opacity: 0.4 }, { opacity: 0.1 } ] },
			},
			bars: {
				lineWidth: 1, // in pixels
				barWidth: 1, // in units of the x axis
				fill: true,
				fillColor: { colors: [ { opacity: 0.7 }, { opacity: 1 } ] },
				align: "left", // or "center"
				horizontal: false
			},
			pie: {
				show: false,
				radius: 1,
				label: {
					show: false,
					radius: 2/3,
					formatter: function(label, series){
						return '<div style="font-size:8pt;text-align:center;padding:2px;color:white;text-shadow: 0 1px 0 rgba(0, 0, 0, 0.6);">'+label+'<br/>'+Math.round(series.percent)+'%</div>';
					},
					threshold: 0.1
				}
			},
			shadowSize: 0
		},
		grid: {
			show: true,
			borderColor: "#efefef", // set if different from the grid color
			tickColor: "rgba(0,0,0,0.06)", // color for the ticks, e.g. "rgba(0,0,0,0.15)"
			labelMargin: 10, // in pixels
			axisMargin: 8, // in pixels
			borderWidth: 0, // in pixels
			minBorderMargin: 10, // in pixels, null means taken from points radius
			mouseActiveRadius: 5 // how far the mouse can be away to activate an item
		},
		tooltipOpts: {
			defaultTheme: false
		},
		selection: {
			color: App.getLayoutColorCode('blue')
		}
	};

	var defaultPlotWidgetOptions = {
		colors: ['#ffffff'],
		legend: {
			show: false,
			backgroundOpacity: 0
		},
		series: {
			points: {
			}
		},
		grid: {
			tickColor: 'rgba(255, 255, 255, 0.1)',
			color: '#ffffff',
		},
		shadowSize: 1
	};

	/**************************
	 * Circle Dial (Knob)     *
	 **************************/
	var initKnob = function() {
		if ($.fn.knob) {
			$(".knob").knob();

			// All elements, which has no color specified, apply default color
			$('.knob').each(function () {
				if (typeof $(this).attr('data-fgColor') == 'undefined') {
					$(this).trigger('configure', {
						'fgColor': App.getLayoutColorCode('blue'),
						'inputColor': App.getLayoutColorCode('blue')
					});
				}
			});
		}
	}

	/**************************
	 * Sparkline Statbox Defaults
	 **************************/
	var defaultSparklineStatboxOptions = {
		type: 'bar',
		height: '19px',
		zeroAxis: false,
		barWidth: '4px',
		barSpacing: '1px',
		barColor: '#fff'
	}

	/**************************
	 * ColorPicker            *
	 **************************/
	var initColorPicker = function() {
		if ($.fn.colorpicker) {
			$('.bs-colorpicker').colorpicker();
		}
	}

	/**************************
	 * Template               *
	 **************************/
	var initTemplate = function() {
		if ($.fn.template) {
			// Set default options
			$.extend(true, $.fn.template.defaults, {

			});
		}
	}

	return {

		// main function to initiate all plugins
		init: function () {
			initBrowserDetection(); // $.browser for jQuery 1.9
			initDaterangepicker(); // Daterangepicker for dashboard
			initSparklines(); // Small charts
			initTooltips(); // Bootstrap tooltips
			initPopovers(); // Bootstrap popovers
			initNoty(); // Notifications
			initDataTables(); // Managed Tables
			initCircularCharts(); // Easy Pie Chart
			initKnob(); // Circle Dial
			initColorPicker(); // Bootstrap ColorPicker
			//initTemplate(); // Template
		},

		getFlotDefaults: function() {
			return defaultPlotOptions;
		},

		getFlotWidgetDefaults: function() {
			return $.extend(true, {}, Plugins.getFlotDefaults(), defaultPlotWidgetOptions);
		},

		getSparklineStatboxDefaults: function() {
			return defaultSparklineStatboxOptions;
		}

	};

}();
$(function() {

    var formElements = function(){                
        // Bootstrap datepicker
        var feDatepicker = function(){                        
            if($(".datepicker").length > 0){
                $(".datepicker").datepicker({format: 'yyyy-mm-dd'});                
                $("#dp-2,#dp-3,#dp-4").datepicker(); // Sample
            }           
            
        }// END Bootstrap datepicker
        
        //Bootstrap timepicker
        var feTimepicker = function(){
            // Default timepicker
            if($(".timepicker").length > 0)
                $('.timepicker').timepicker();
            
            // 24 hours mode timepicker
            if($(".timepicker24").length > 0)
                $(".timepicker24").timepicker({minuteStep: 5,showSeconds: true,showMeridian: false});
            
        }// END Bootstrap timepicker
        
        //Daterangepicker 
        var feDaterangepicker = function(){
            if($(".daterange").length > 0)
               $(".daterange").daterangepicker({format: 'YYYY-MM-DD',startDate: '2013-01-01',endDate: '2013-12-31'});
        }
        // END Daterangepicker
        
        //Bootstrap colopicker        
        var feColorpicker = function(){
            // Default colorpicker hex
            if($(".colorpicker").length > 0)
                $(".colorpicker").colorpicker({format: 'hex'});
            
            // RGBA mode
            if($(".colorpicker_rgba").length > 0)
                $(".colorpicker_rgba").colorpicker({format: 'rgba'});
            
            // Sample
            if($("#colorpicker").length > 0)
                $("#colorpicker").colorpicker();
            
        }// END Bootstrap colorpicker
        
        //Bootstrap select
        var feSelect = function(){
            if($(".select").length > 0){
                $(".select").selectpicker();
                
                $(".select").on("change", function(){
                    if($(this).val() == "" || null === $(this).val()){
                        if(!$(this).attr("multiple"))
                            $(this).val("").find("option").removeAttr("selected").prop("selected",false);
                    }else{
                        $(this).find("option[value="+$(this).val()+"]").attr("selected",true);
                    }
                });
            }
        }//END Bootstrap select
        
        
        //Validation Engine
        var feValidation = function(){
            if($("form[id^='validate']").length > 0){
                
                // Validation prefix for custom form elements
                var prefix = "valPref_";
                
                //Add prefix to Bootstrap select plugin
                $("form[id^='validate'] .select").each(function(){
                   $(this).next("div.bootstrap-select").attr("id", prefix + $(this).attr("id")).removeClass("validate[required]");
                });
                
                // Validation Engine init
                $("form[id^='validate']").validationEngine('attach', {promptPosition : "bottomLeft", scroll: false,
                                                                        onValidationComplete: function(form, status){
                                                                            form.validationEngine("updatePromptsPosition");
                                                                        },
                                                                        prettySelect : true,
                                                                        usePrefix: prefix 
                                                                     });              
            }
        }//END Validation Engine
        
        //Masked Inputs
        var feMasked = function(){            
            if($("input[class^='mask_']").length > 0){
                $("input.mask_tin").mask('99-9999999');
                $("input.mask_ssn").mask('999-99-9999');        
                $("input.mask_date").mask('9999-99-99');
                $("input.mask_product").mask('a*-999-a999');
                $("input.mask_phone").mask('99 (999) 999-99-99');
                $("input.mask_phone_ext").mask('99 (999) 999-9999? x99999');
                $("input.mask_credit").mask('9999-9999-9999-9999');        
                $("input.mask_percent").mask('99%');
            }            
        }//END Masked Inputs
        
        //Bootstrap tooltip
        var feTooltips = function(){            
            $("body").tooltip({selector:'[data-toggle="tooltip"]',container:"body"});
        }//END Bootstrap tooltip
       
        //Bootstrap Popover
        var fePopover = function(){            
            $("[data-toggle=popover]").popover();
            $(".popover-dismiss").popover({trigger: 'focus'});
        }//END Bootstrap Popover
        
        //Tagsinput
        var feTagsinput = function(){
            if($(".tagsinput").length > 0){
                
                $(".tagsinput").each(function(){
                    
                    if($(this).data("placeholder") != ''){
                        var dt = $(this).data("placeholder");
                    }else
                        var dt = 'add a tag';
                                                            
                    $(this).tagsInput({width: '100%',height:'auto',defaultText: dt});
                });

            }
        }// END Tagsinput
        
        //iCheckbox and iRadion - custom elements
        var feiCheckbox = function(){
            if($(".icheckbox").length > 0){
                 $(".icheckbox,.iradio").iCheck({checkboxClass: 'icheckbox_minimal-grey',radioClass: 'iradio_minimal-grey'});
            }
        }
        // END iCheckbox
        
        //Bootstrap file input
        var feBsFileInput = function(){
            
            if($("input.fileinput").length > 0)
                $("input.fileinput").bootstrapFileInput();
            
        }
        //END Bootstrap file input
        
        return {// Init all form element features
		init: function(){                    
                    feDatepicker();                    
                    feTimepicker();
                    feColorpicker();
                    feSelect();
                    feValidation();
                    feMasked();
                    feTooltips();
                    fePopover();
                    feTagsinput();
                    feiCheckbox();
                    feBsFileInput();
                    feDaterangepicker();
                }
        }
    }();

    var uiElements = function(){

        //Datatables
        var uiDatatable = function(){
            if($(".datatable").length > 0){                
                $(".datatable").dataTable();
                $(".datatable").on('page.dt',function () {
                    onresize(100);
                });
            }
            
            if($(".datatable_simple").length > 0){                
                $(".datatable_simple").dataTable({"ordering": false, "info": false, "lengthChange": false,"searching": false});
                $(".datatable_simple").on('page.dt',function () {
                    onresize(100);
                });                
            }            
        }//END Datatable        
        
        //RangeSlider // This function can be removed or cleared.
        var uiRangeSlider = function(){
            
            //Default Slider with start value
            if($(".defaultSlider").length > 0){                
                $(".defaultSlider").each(function(){                    
                    var rsMin = $(this).data("min");
                    var rsMax = $(this).data("max");

                    $(this).rangeSlider({                        
                        bounds: {min: 1, max: 200},
                        defaultValues: {min: rsMin, max: rsMax}
                    });                    
                });                                
            }//End Default
            
            //Date range slider
            if($(".dateSlider").length > 0){                
                $(".dateSlider").each(function(){
                    $(this).dateRangeSlider({
                        bounds: {min: new Date(2012, 1, 1), max: new Date(2015, 12, 31)},
                        defaultValues:{min: new Date(2012, 10, 15),max: new Date(2014, 12, 15)}
                    });
                });                                                
            }//End date range slider
            
            //Range slider with predefinde range            
            if($(".rangeSlider").length > 0){                
                $(".rangeSlider").each(function(){                    
                    var rsMin = $(this).data("min");
                    var rsMax = $(this).data("max");

                    $(this).rangeSlider({
                        bounds: {min: 1, max: 200},
                        range: {min: 20, max: 40},
                        defaultValues: {min: rsMin, max: rsMax}
                    });                    
                });                                
            }//End
            
            //Range Slider with custom step
            if($(".stepSlider").length > 0){                
                $(".stepSlider").each(function(){
                    var rsMin = $(this).data("min");
                    var rsMax = $(this).data("max");

                    $(this).rangeSlider({                        
                        bounds: {min: 1, max: 200},
                        defaultValues: {min: rsMin, max: rsMax},
                        step: 10
                    });    
                });                                                
            }//End
            
        }//END RangeSlider
        
        //Start Knob Plugin
        var uiKnob = function(){
            
            if($(".knob").length > 0){
                $(".knob").knob();
            }            
            
        }//End Knob
        
        // Start Smart Wizard
        var uiSmartWizard = function(){
            
            if($(".wizard").length > 0){
                
                //Check count of steps in each wizard
                $(".wizard > ul").each(function(){
                    $(this).addClass("steps_"+$(this).children("li").length);
                });//end
                
                // This par of code used for example
                if($("#wizard-validation").length > 0){
                    
                    var validator = $("#wizard-validation").validate({
                            rules: {
                                login: {
                                    required: true,
                                    minlength: 2,
                                    maxlength: 8
                                },
                                password: {
                                    required: true,
                                    minlength: 5,
                                    maxlength: 10
                                },
                                repassword: {
                                    required: true,
                                    minlength: 5,
                                    maxlength: 10,
                                    equalTo: "#password"
                                },
                                email: {
                                    required: true,
                                    email: true
                                },
                                name: {
                                    required: true,
                                    maxlength: 10
                                },
                                adress: {
                                    required: true
                                }
                            }
                        });
                        
                }// End of example
                
                $(".wizard").smartWizard({                        
                    // This part of code can be removed FROM
                    onLeaveStep: function(obj){
                        var wizard = obj.parents(".wizard");

                        if(wizard.hasClass("wizard-validation")){
                            
                            var valid = true;
                            
                            $('input,textarea',$(obj.attr("href"))).each(function(i,v){
                                valid = validator.element(v) && valid;
                            });
                                                        
                            if(!valid){
                                wizard.find(".stepContainer").removeAttr("style");
                                validator.focusInvalid();                                
                                return false;
                            }         
                            
                        }    
                        
                        return true;
                    },// <-- TO
                    
                    //This is important part of wizard init
                    onShowStep: function(obj){                        
                        var wizard = obj.parents(".wizard");

                        if(wizard.hasClass("show-submit")){
                        
                            var step_num = obj.attr('rel');
                            var step_max = obj.parents(".anchor").find("li").length;

                            if(step_num == step_max){                             
                                obj.parents(".wizard").find(".actionBar .btn-primary").css("display","block");
                            }                         
                        }
                        return true;                         
                    }//End
                });
            }            
            
        }// End Smart Wizard
        
        //OWL Carousel
        var uiOwlCarousel = function(){
            
            if($(".owl-carousel").length > 0){
                $(".owl-carousel").owlCarousel({mouseDrag: false, touchDrag: true, slideSpeed: 300, paginationSpeed: 400, singleItem: true, navigation: false,autoPlay: true});
            }
            
        }//End OWL Carousel
        
        // Summernote 
        var uiSummernote = function(){
            /* Extended summernote editor */
            if($(".summernote").length > 0){
                $(".summernote").summernote({height: 250,
                                             codemirror: {
                                                mode: 'text/html',
                                                htmlMode: true,
                                                lineNumbers: true,
                                                theme: 'default'
                                              }
                });
            }
            /* END Extended summernote editor */
            
            /* Lite summernote editor */
            if($(".summernote_lite").length > 0){
                
                $(".summernote_lite").on("focus",function(){
                    
                    $(".summernote_lite").summernote({height: 100, focus: true,
                                                      toolbar: [
                                                          ["style", ["bold", "italic", "underline", "clear"]],
                                                          ["insert",["link","picture","video"]]                                                          
                                                      ]
                                                     });
                });                
            }
            /* END Lite summernote editor */
            
            /* Email summernote editor */
            if($(".summernote_email").length > 0){
                                                    
                $(".summernote_email").summernote({height: 400, focus: true,
                                                  toolbar: [
                                                      ['style', ['bold', 'italic', 'underline', 'clear']],
                                                      ['font', ['strikethrough']],
                                                      ['fontsize', ['fontsize']],
                                                      ['color', ['color']],
                                                      ['para', ['ul', 'ol', 'paragraph']],
                                                      ['height', ['height']]                                                          
                                                  ]
                                                 });
                
            }
            /* END Email summernote editor */
            
        }// END Summernote 
        
        // Custom Content Scroller
        var uiScroller = function(){
            
            if($(".scroll").length > 0){
                $(".scroll").mCustomScrollbar({axis:"y", autoHideScrollbar: true, scrollInertia: 20, advanced: {autoScrollOnFocus: false}});
            }
            
        }// END Custom Content Scroller
       
        // Sparkline
        var uiSparkline = function(){
            
            if($(".sparkline").length > 0)
               $(".sparkline").sparkline('html', { enableTagOptions: true,disableHiddenCheck: true});   
           
       }// End sparkline              
       
        $(window).resize(function(){
            if($(".owl-carousel").length > 0){
                $(".owl-carousel").data('owlCarousel').destroy();
                uiOwlCarousel();
            }
        });
       
        return {
            init: function(){
                uiDatatable();
                uiRangeSlider();
                uiKnob();
                uiSmartWizard();
                uiOwlCarousel();
                uiSummernote();
                uiScroller();
                uiSparkline();
            }
        }
        
    }();

    var templatePlugins = function(){
        
        var tp_clock = function(){
            
            function tp_clock_time(){
                var now     = new Date();
                var hour    = now.getHours();
                var minutes = now.getMinutes();                    
                
                hour = hour < 10 ? '0'+hour : hour;
                minutes = minutes < 10 ? '0'+minutes : minutes;
                
                $(".plugin-clock").html(hour+"<span>:</span>"+minutes);
            }
            if($(".plugin-clock").length > 0){
                
                tp_clock_time();
                
                window.setInterval(function(){
                    tp_clock_time();                    
                },10000);
                
            }
        }
        
        var tp_date = function(){
            
            if($(".plugin-date").length > 0){
                
                var days = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'];
                var months = ['January','February','March','April','May','June','July','August','September','October','November','December'];
                        
                var now     = new Date();
                var day     = days[now.getDay()];
                var date    = now.getDate();
                var month   = months[now.getMonth()];
                var year    = now.getFullYear();
                
                $(".plugin-date").html(day+", "+month+" "+date+", "+year);
            }
            
        }
        
        return {
            init: function(){
                tp_clock();
                tp_date();
            }
        }
    }();
    
    var fullCalendar = function(){
            
        var calendar = function(){
            
            if($("#calendar").length > 0){
                
                function prepare_external_list(){
                    
                    $('#external-events .external-event').each(function() {
                            var eventObject = {title: $.trim($(this).text())};

                            $(this).data('eventObject', eventObject);
                            $(this).draggable({
                                    zIndex: 999,
                                    revert: true,
                                    revertDuration: 0
                            });
                    });                    
                    
                }
                
                
                var date = new Date();
                var d = date.getDate();
                var m = date.getMonth();
                var y = date.getFullYear();

                prepare_external_list();

                var calendar = $('#calendar').fullCalendar({
                    header: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'month,agendaWeek,agendaDay'
                    },
                    editable: true,
                    eventSources: {url: "assets/ajax_fullcalendar.php"},
                    droppable: true,
                    selectable: true,
                    selectHelper: true,
                    select: function(start, end, allDay) {
                        var title = prompt('Event Title:');
                        if (title) {
                            calendar.fullCalendar('renderEvent',
                            {
                                title: title,
                                start: start,
                                end: end,
                                allDay: allDay
                            },
                            true
                            );
                        }
                        calendar.fullCalendar('unselect');
                    },
                    drop: function(date, allDay) {

                        var originalEventObject = $(this).data('eventObject');

                        var copiedEventObject = $.extend({}, originalEventObject);

                        copiedEventObject.start = date;
                        copiedEventObject.allDay = allDay;

                        $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);


                        if ($('#drop-remove').is(':checked')) {
                            $(this).remove();
                        }

                    }
                });
                
                $("#new-event").on("click",function(){
                    var et = $("#new-event-text").val();
                    if(et != ''){
                        $("#external-events").prepend('<a class="list-group-item external-event">'+et+'</a>');
                        prepare_external_list();
                    }
                });
                
            }            
        }
        
        return {
            init: function(){
                calendar();
            }
        }
    }();
    
    formElements.init();
    uiElements.init();
    templatePlugins.init();    
    
    fullCalendar.init();
    
    /* My Custom Progressbar */
    $.mpb = function(action,options){

        var settings = $.extend({
            state: '',            
            value: [0,0],
            position: '',
            speed: 20,
            complete: null
        },options);

        if(action == 'show' || action == 'update'){
            
            if(action == 'show'){
                $(".mpb").remove();
                var mpb = '<div class="mpb '+settings.position+'">\n\
                               <div class="mpb-progress'+(settings.state != '' ? ' mpb-'+settings.state: '')+'" style="width:'+settings.value[0]+'%;"></div>\n\
                           </div>';
                $('body').append(mpb);
            }
            
            var i  = $.isArray(settings.value) ? settings.value[0] : $(".mpb .mpb-progress").width();
            var to = $.isArray(settings.value) ? settings.value[1] : settings.value;            
            
            var timer = setInterval(function(){
                $(".mpb .mpb-progress").css('width',i+'%'); i++;
                
                if(i > to){
                    clearInterval(timer);
                    if($.isFunction(settings.complete)){
                        settings.complete.call(this);
                    }
                }
            }, settings.speed);

        }

        if(action == 'destroy'){
            $(".mpb").remove();
        }                
        
    }
    /* Eof My Custom Progressbar */
    
    
    // New selector case insensivity        
     $.expr[':'].containsi = function(a, i, m) {
         return jQuery(a).text().toUpperCase().indexOf(m[3].toUpperCase()) >= 0;
     };              
});

Object.size = function(obj) {
    var size = 0, key;
    for (key in obj) {
        if (obj.hasOwnProperty(key)) size++;
    }
    return size;
};