import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:listar_flutter_pro/configs/config.dart';
import 'package:listar_flutter_pro/models/model.dart';
import 'package:listar_flutter_pro/widgets/app_star_rating.dart';
import 'package:shimmer/shimmer.dart';

class AppCommentItem extends StatelessWidget {
  final CommentModel item;

  AppCommentItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (item == null) {
      return Shimmer.fromColors(
        baseColor: Theme.of(context).hoverColor,
        highlightColor: Theme.of(context).highlightColor,
        enabled: true,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).dividerColor,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                height: 10,
                                width: 100,
                                color: Colors.white,
                              ),
                              Container(
                                height: 10,
                                width: 50,
                                color: Colors.white,
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                          ),
                          Container(
                            height: 10,
                            width: 50,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, bottom: 10),
                child: Container(
                  height: 10,
                  width: 100,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3),
                child: Container(
                  height: 10,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3),
                child: Container(
                  height: 10,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3),
                child: Container(
                  height: 10,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3),
                child: Container(
                  height: 10,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3),
                child: Container(
                  height: 10,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(
        10,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).dividerColor,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: item.userImage,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                placeholder: (context, url) {
                  return Shimmer.fromColors(
                    baseColor: Theme.of(context).hoverColor,
                    highlightColor: Theme.of(context).highlightColor,
                    enabled: true,
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
                errorWidget: (context, url, error) {
                  return Shimmer.fromColors(
                    baseColor: Theme.of(context).hoverColor,
                    highlightColor: Theme.of(context).highlightColor,
                    enabled: true,
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(Icons.error),
                    ),
                  );
                },
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              item.userName,
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                          Text(
                            DateFormat('yyyy-MM-dd').format(item.createDate),
                            style: Theme.of(context).textTheme.caption,
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 3),
                      ),
                      StarRating(
                        rating: item.rate,
                        size: 14,
                        color: AppTheme.yellowColor,
                        borderColor: AppTheme.yellowColor,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 4)),
          Text(
            item.comment,
            maxLines: 5,
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
    );
  }
}
