(function ($) {
     $.extend(true, window, {
          "Ext": {
               "Plugins": {
                    "HeaderFilter": HeaderFilter
               }
          }
     });

     /*
     Based on SlickGrid Header Menu Plugin (https://github.com/mleibman/SlickGrid/blob/master/plugins/slick.headermenu.js)
 
     (Can't be used at the same time as the header menu plugin as it implements the dropdown in the same way)
     */

     function HeaderFilter(options) {
          var grid;
          var self = this;
          var handler = new Slick.EventHandler();
          var defaults = {
               buttonImage: "/resource/SlickGrid/images/down.png",
               filterImage: "/resource/SlickGrid/images/filter.png",
               sortAscImage: "/resource/SlickGrid/images/sort-asc.png",
               sortDescImage: "/resource/SlickGrid/images/sort-desc.png"
          };
          var $menu;
          var workingFilters;

          function init(g) {
               options = $.extend(true, {}, defaults, options);
               grid = g;
               handler.subscribe(grid.onHeaderCellRendered, handleHeaderCellRendered)
                    .subscribe(grid.onBeforeHeaderCellDestroy, handleBeforeHeaderCellDestroy)
                    .subscribe(grid.onClick, handleBodyMouseDown)
                    .subscribe(grid.onColumnsResized, columnsResized);

               grid.setColumns(grid.getColumns());

               $(document.body).bind("mousedown", handleBodyMouseDown);
          }

          function destroy() {
               handler.unsubscribeAll();
               $(document.body).unbind("mousedown", handleBodyMouseDown);
          }

          function handleBodyMouseDown(e) {
               if ($menu && $menu[0] != e.target && !$.contains($menu[0], e.target)) {
                    hideMenu();
               }
          }

          function hideMenu() {
               if ($menu) {
                    $menu.remove();
                    $menu = null;
               }
          }

          function handleHeaderCellRendered(e, args) {
               var column = args.column;

               // JJ Added 05/27/2020
               // Prevent plugin from generating checkbox dropdown
               if (column.id != "_checkbox_selector") {
                    var $el = $("<div></div>")
                         .addClass("slick-header-menubutton")
                         .data("column", column);

                    if (options.buttonImage) {
                         $el.css("background-image", "url(" + options.buttonImage + ")");
                    }

                    $el.bind("click", showFilter).appendTo(args.node);
               }

          }

          function handleBeforeHeaderCellDestroy(e, args) {
               $(args.node)
                    .find(".slick-header-menubutton")
                    .remove();
          }

          function addMenuItem(menu, columnDef, title, command, image) {
               var $item = $("<div class='slick-header-menuitem'>")
                    .data("command", command)
                    .data("column", columnDef)
                    .bind("click", handleMenuItemClick)
                    .appendTo(menu);

               var $icon = $("<div class='slick-header-menuicon'>")
                    .appendTo($item);

               if (image) {
                    $icon.css("background-image", "url(" + image + ")");
               }

               $("<span class='slick-header-menucontent'>")
                    .text(title)
                    .appendTo($item);
          }

          function addMenuCombo(menu, columnDef) {
               var $select = $("<select class='operation' id='operation' style='margin-top: 5px; width: 50px' title='Hover Over for Explanation'>" +
                    "<option value=0 selected>=</option>" +
                    "<option value=1>&gt;</option>" +
                    "<option value=2>&lt;</option>" +
                    "<option value=3>Not =</option>" +
                    "<option value=4 title='Example: 10 20'>Btw</option>")


               var $input = $("<input class='input' placeholder='Search' style='margin-top: 5px; width: 150px'>")
                    .data("column", columnDef);

               $select
                    .bind("change", function (e) {
                         $($input).val('');
                         var filterVals = getFilterValuesBySelect($input, $(this));
                         updateFilterInputs(menu, columnDef, filterVals);
                    })
                    .appendTo(menu);

               $input.bind("keyup", function (e) {
                    var filterVals = getFilterValuesBySelect($(this), $select);
                    updateFilterInputs(menu, columnDef, filterVals);
               }).appendTo(menu);
          }

          function addMenuInput(menu, columnDef) {
               $("<input class='input' placeholder='Search' style='margin-top: 5px; width: 206'>")
                    .data("column", columnDef)
                    .bind("keyup", function (e) {
                         var filterVals = getFilterValuesByInput($(this));
                         updateFilterInputs(menu, columnDef, filterVals);
                    })
                    .appendTo(menu);
          }

          function updateFilterInputs(menu, columnDef, filterItems) {
               var filterOptions = "<label><input type='checkbox' value='-1' />(Select All)</label>";
               columnDef.filterValues = columnDef.filterValues || [];

               // WorkingFilters is a copy of the filters to enable apply/cancel behaviour
               workingFilters = columnDef.filterValues.slice(0);

               for (var i = 0; i < filterItems.length; i++) {
                    var filtered = _.contains(workingFilters, filterItems[i]);

                    filterOptions += "<label><input type='checkbox' value='" + i + "'"
                         + (filtered ? " checked='checked'" : "")
                         + "/>" + filterItems[i] + "</label>";
               }
               var $filter = menu.find('.filter');
               $filter.empty().append($(filterOptions));

               $(':checkbox', $filter).bind('click', function () {
                    workingFilters = changeWorkingFilter(filterItems, workingFilters, $(this));
               });
          }

          function showFilter(e) {
               var $menuButton = $(this);
               var columnDef = $menuButton.data("column");

               columnDef.filterValues = columnDef.filterValues || [];

               // WorkingFilters is a copy of the filters to enable apply/cancel behaviour
               workingFilters = columnDef.filterValues.slice(0);

               var filterItems;

               if (workingFilters.length === 0) {
                    // Filter based all available values
                    filterItems = getFilterValues(grid.getData(), columnDef);
               }
               else {
                    // Filter based on current dataView subset
                    filterItems = getAllFilterValues(grid.getData().getItems(), columnDef);
               }

               if (!$menu) {
                    $menu = $("<div class='slick-header-menu'>").appendTo(document.body);
               }

               $menu.empty();

               addMenuItem($menu, columnDef, 'Sort Ascending', 'sort-asc', options.sortAscImage);
               addMenuItem($menu, columnDef, 'Sort Descending', 'sort-desc', options.sortDescImage);

               // JJ Modified 05/28/2020
               if (columnDef.dataType != "integer") {
                    addMenuInput($menu, columnDef);
               } else {
                    addMenuCombo($menu, columnDef);
               }

               var filterOptions = "<label><input type='checkbox' value='-1' />(Select All)</label>";

               for (var i = 0; i < filterItems.length; i++) {
                    var filtered = _.contains(workingFilters, filterItems[i]);

                    filterOptions += "<label><input type='checkbox' value='" + i + "'"
                         + (filtered ? " checked='checked'" : "")
                         + "/>" + filterItems[i] + "</label>";
               }

               var $filter = $("<div class='filter'>")
                    .append($(filterOptions))
                    .appendTo($menu);

               $('<button>OK</button>')
                    .appendTo($menu)
                    .bind('click', function (ev) {
                         columnDef.filterValues = workingFilters.splice(0);
                         setButtonImage($menuButton, columnDef.filterValues.length > 0);
                         handleApply(ev, columnDef);
                    });

               $('<button>Clear</button>')
                    .appendTo($menu)
                    .bind('click', function (ev) {
                         columnDef.filterValues.length = 0;
                         setButtonImage($menuButton, false);
                         handleApply(ev, columnDef);
                    });

               $('<button>Cancel</button>')
                    .appendTo($menu)
                    .bind('click', hideMenu);

               $(':checkbox', $filter).bind('click', function () {
                    workingFilters = changeWorkingFilter(filterItems, workingFilters, $(this));
               });

               var offset = $(this).offset();
               var left = offset.left - $menu.width() + $(this).width() - 8;

               var menutop = offset.top + $(this).height();

               if (menutop + offset.top > $(window).height()) {
                    menutop -= ($menu.height() + $(this).height() + 8);
               }

               e.preventDefault();
               e.stopPropagation();

               $menu.css("top", menutop)
                    .css("left", (left > 0 ? left : 0));
          }

          function columnsResized() {
               hideMenu();
          }

          function changeWorkingFilter(filterItems, workingFilters, $checkbox) {
               var value = $checkbox.val();
               var $filter = $checkbox.parent().parent();

               if ($checkbox.val() < 0) {
                    // Select All
                    if ($checkbox.prop('checked')) {
                         $(':checkbox', $filter).prop('checked', true);
                         workingFilters = filterItems.slice(0);
                    } else {
                         $(':checkbox', $filter).prop('checked', false);
                         workingFilters.length = 0;
                    }
               } else {
                    var index = _.indexOf(workingFilters, filterItems[value]);

                    if ($checkbox.prop('checked') && index < 0) {
                         workingFilters.push(filterItems[value]);
                    }
                    else {
                         if (index > -1) {
                              workingFilters.splice(index, 1);
                         }
                    }
               }

               return workingFilters;
          }

          function setButtonImage($el, filtered) {
               var image = "url(" + (filtered ? options.filterImage : options.buttonImage) + ")";

               $el.css("background-image", image);
          }

          function handleApply(e, columnDef) {
               hideMenu();

               self.onFilterApplied.notify({ "grid": grid, "column": columnDef }, e, self);

               e.preventDefault();
               e.stopPropagation();
          }

          function getFilterValues(dataView, column) {
               var seen = [];
               for (var i = 0; i < dataView.getLength(); i++) {

                    // JJ Removed 02/27/2020
                    //var value = dataView.getItem(i)[column.field];
                    var value = getData(i, dataView, column);

                    if (!_.contains(seen, value)) {
                         seen.push(value);
                    }
               }

               return _.sortBy(seen, function (v) { return v; });
          }

          function getFilterValuesByInput($input) {
               var column = $input.data("column"),
                    filter = $input.val(),
                    dataView = grid.getData(),
                    seen = [];

               for (var i = 0; i < dataView.getLength(); i++) {
                    // JJ Removed 02/27/2020
                    //var value = dataView.getItem(i)[column.field];
                    var value = getData(i, dataView, column);

                    if (filter.length > 0) {
                         var mVal = !value ? '' : value;
                         var lowercaseFilter = filter.toString().toLowerCase();
                         var lowercaseVal = mVal.toString().toLowerCase();
                         if (!_.contains(seen, value) && lowercaseVal.indexOf(lowercaseFilter) > -1) {
                              seen.push(value);
                         }
                    }
                    else {
                         if (!_.contains(seen, value)) {
                              seen.push(value);
                         }
                    }
               }

               return _.sortBy(seen, function (v) { return v; });
          }

          // JJ Added 05/30/2020
          // Handle math comparisons
          function getFilterValuesBySelect($input, $select) {
               var column = $input.data("column");
               var filter = $input.val().toString().trim();

               if (filter.indexOf(' ') > -1) {
                    filter = filter.split(' ');
               } else {
                    filter = parseInt(filter);
               }

               var comparison = parseInt($select.val());
               var dataView = grid.getData();
               var seen = [];

               for (var i = 0; i < dataView.getLength(); i++) {
                    var value = getData(i, dataView, column);

                    if (!isNaN(filter) || Array.isArray(filter)) {
                         var contain = false;

                         switch (comparison) {
                              case 0:
                                   if (value == filter) contain = true;
                                   break;
                              case 1:
                                   if (value > filter) contain = true;
                                   break;
                              case 2:
                                   if (value < filter) contain = true;
                                   break;
                              case 3:
                                   if (value != filter) contain = true;
                                   break;
                              case 4:
                                   if (parseInt(filter[0]) <= value && value <= parseInt(filter[1])) contain = true;
                                   break;
                         }

                         if (contain) {
                              seen.push(value);
                         }
                    }
                    else {
                         if (!_.contains(seen, value)) {
                              seen.push(value);
                         }
                    }
               }

               return _.sortBy(seen, function (v) { return v; });
          }

          function getAllFilterValues(data, column) {
               var seen = [];
               for (var i = 0; i < data.length; i++) {

                    // JJ Added 02/27/2020
                    var value;

                    if (column.linkObject == undefined) {
                         // JJ Added 03/12/2020
                         if (typeof column.field == "object") {
                              value = data[i][column.field][0];
                         }
                         else {
                              // JJ Added 05/13/2020
                              var objFunction;

                              value = data[i][column.field];

                              if (column.formatter && column.formatter.name.toLowerCase().search(/link/g) == -1) {
                                   objFunction = column.formatter;
                              }
                              else {
                                   objFunction = undefined;
                              }

                              if (objFunction) {
                                   value = objFunction(i, data, value, column, data)
                              }
                         }
                    }
                    else {
                         value = data[i][column.linkObject][column.linkDisplayField];
                    }
                    if (!_.contains(seen, value)) {
                         seen.push(value);
                    }
               }

               return _.sortBy(seen, function (v) { return v; });
          }

          function handleMenuItemClick(e) {
               var command = $(this).data("command");
               var columnDef = $(this).data("column");

               hideMenu();

               self.onCommand.notify({
                    "grid": grid,
                    "column": columnDef,
                    "command": command
               }, e, self);

               e.preventDefault();
               e.stopPropagation();
          }

          $.extend(this, {
               "init": init,
               "destroy": destroy,
               "onFilterApplied": new Slick.Event(),
               "onCommand": new Slick.Event()
          });

          // JJ Added 02/27/2020
          // Function to get data depending on custom objects
          function getData(i, dataView, column) {
               var value;
               var objFunction;
               if (column.linkObject == undefined) {
                    if (column.formatter && column.formatter.name.toLowerCase().search(/link/g) == -1) {
                         objFunction = column.formatter;
                    }
                    else {
                         objFunction = undefined;
                    }

                    if (objFunction) {
                         value = objFunction(i, dataView.getItem(i), dataView.getItem(i)[column.field], column, dataView.getItem(i))
                    }
                    else {
                         value = dataView.getItem(i)[column.field];
                    }
               }
               else {
                    if (dataView.getItem(i)[column.linkObject]) {
                         value = dataView.getItem(i)[column.linkObject][column.linkDisplayField];
                    }
               }

               return value;
          }
     }
})(jQuery);