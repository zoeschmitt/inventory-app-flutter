import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    Key key,
    @required TextEditingController searchQueryController,
  })  : _searchQueryController = searchQueryController,
        super(key: key);

  final TextEditingController _searchQueryController;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 3.0, bottom: 3.0, left: 15.0, right: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Icon(
                      SFSymbols.search,
                      color: Colors.black26,
                      size: 26,
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: TextField(
                        maxLines: 1,
                        controller: _searchQueryController,
                        autofocus: false,
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 18,
                            color: Colors.black87,
                            fontWeight: FontWeight.w400),
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "Search",
                          hintStyle:
                              TextStyle(color: Colors.black26, fontSize: 18),
                        ),
                        //onChanged: (query) => updateSearchQuery,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
