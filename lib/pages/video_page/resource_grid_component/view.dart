import 'package:dogetv_flutter/pages/video_page/action.dart';
import 'package:dogetv_flutter/pages/video_page/resource_grid_component/component.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

Widget buildView(Resource state, dispatch, ViewService viewService) {
  return GridView.builder(
    padding: EdgeInsets.all(8.0),
    shrinkWrap: true,
    physics: ClampingScrollPhysics(),
    itemCount: state.items.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 2.5,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0),
    itemBuilder: (BuildContext context, int index) {
      final source = state.items[index];
      final isSelected = source == state.selectedItem;
      return GestureDetector(
        onTap: () => dispatch(
            VideoPageActionCreator.onUpdateSourceAction(source.toString())),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              border: Border.all(
                  color: isSelected
                      ? Theme.of(context).accentColor
                      : Colors.white24,
                  width: 0.5)),
          child: Center(
            child: Text(source == 0 ? "默认线路" : "线路$source",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: isSelected ? Theme.of(context).accentColor : null)),
          ),
        ),
      );
    },
  );
}
