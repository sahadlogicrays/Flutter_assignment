

# Issues: 

- We are not using any decoration or any other property of container so we need to use padding Widget.
- Added the missing Key? key parameter to the constructor of ListWidget and ListItemWidget.
- Updated the for loop in ListWidget to iterate until i < 100 instead of i <= 100 to generate 100 list items otherwise it will show 101 items.
- Declared count as a late variable in _ListItemWidgetState to ensure it's initialized before being used in the build method.
- Initialized count to 0 in the initState method of _ListItemWidgetState to reset its value when a new instance of ListItemWidget is created.
- Called setState update all widget build again and not best practice to go with.


