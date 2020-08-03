import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/widgets/buttons/custom_button.dart';
import 'package:inventory/widgets/image_carousel_widget.dart';
import 'package:inventory/widgets/info_container_widget.dart';
import 'package:inventory/widgets/location_container_widget.dart';
import 'package:inventory/widgets/small_container.dart';
import 'package:inventory/widgets/top_options.dart';
import 'package:inventory/widgets/view_coa_report_widget.dart';

//for the list on the home page get an endpoint that only gives you
//the 3 details plus an id, if they tap one then i use the id to get more details

class ItemPage extends StatefulWidget {
  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25, top: 20),
                child: TopOptions(),
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        'Product Name',
                        maxLines: 2,
                        style: GoogleFonts.libreFranklin(
                        fontSize: 30,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(width: 20),
                    SmallContainer(text: "Retail")
                  ],
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25),
                child: Text(
                  'SKU 29347204732',
                  maxLines: 2,
                  style: GoogleFonts.libreFranklin(
                        fontSize: 16,
                        color: Colors.black26,
                        fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: 30),
              ImageCarouselWidget(),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InfoContainerWidget(
                      label: "Quantity",
                      innerTxt: "227",
                    ),
                    InfoContainerWidget(
                      label: "Height",
                      innerTxt: "30mm",
                    ),
                    InfoContainerWidget(
                      label: "Width",
                      innerTxt: "50mm",
                    ),
                    InfoContainerWidget(
                      label: "Weight",
                      innerTxt: "38.6g",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding:
                    const EdgeInsets.only(left: 25.0, right: 25, bottom: 40),
                child: Column(
                  children: <Widget>[
                    LocationContainerWidget(),
                    SizedBox(height: 15),
                    ViewCOAReportWidget(),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Notes',
                          maxLines: 2,
                          style: GoogleFonts.libreFranklin(
                        fontSize: 20,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600),
                        ),
                        CustomButton(icon: Icons.add,)
                      ],
                    ),
                    //add notes here if item has any
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

// namespace QuickType
// {
//     using System;
//     using System.Collections.Generic;

//     using System.Globalization;
//     using Newtonsoft.Json;
//     using Newtonsoft.Json.Converters;

//     public partial class Welcome
//     {
//         [JsonProperty("type")]
//         public string Type { get; set; }

//         [JsonProperty("id")]
//         public string Id { get; set; }

//         [JsonProperty("updated_at")]
//         public DateTimeOffset UpdatedAt { get; set; }

//         [JsonProperty("version")]
//         public long Version { get; set; }

//         [JsonProperty("is_deleted")]
//         public bool IsDeleted { get; set; }

//         [JsonProperty("present_at_all_locations")]
//         public bool PresentAtAllLocations { get; set; }

//         [JsonProperty("present_at_location_ids")]
//         public string[] PresentAtLocationIds { get; set; }

//         [JsonProperty("item_variation_data")]
//         public ItemVariationData ItemVariationData { get; set; }
//     }

//     public partial class ItemVariationData
//     {
//         [JsonProperty("item_id")]
//         public string ItemId { get; set; }

//         [JsonProperty("name")]
//         public string Name { get; set; }

//         [JsonProperty("sku")]
//         public string Sku { get; set; }

//         [JsonProperty("ordinal")]
//         public long Ordinal { get; set; }

//         [JsonProperty("pricing_type")]
//         public string PricingType { get; set; }

//         [JsonProperty("price_money")]
//         public PriceMoney PriceMoney { get; set; }
//     }

//     public partial class PriceMoney
//     {
//         [JsonProperty("amount")]
//         public long Amount { get; set; }

//         [JsonProperty("currency")]
//         public string Currency { get; set; }
//     }
// }

// namespace QuickType
// {
//     using System;
//     using System.Collections.Generic;

//     using System.Globalization;
//     using Newtonsoft.Json;
//     using Newtonsoft.Json.Converters;

//     public partial class ItemData
//     {
//         [JsonProperty("name")]
//         public string Name { get; set; }

//         [JsonProperty("description")]
//         public string Description { get; set; }

//         [JsonProperty("visibility")]
//         public string Visibility { get; set; }

//         [JsonProperty("available_online")]
//         public bool AvailableOnline { get; set; }

//         [JsonProperty("available_for_pickup")]
//         public bool AvailableForPickup { get; set; }

//         [JsonProperty("available_electronically")]
//         public bool AvailableElectronically { get; set; }

//         [JsonProperty("category_id")]
//         public string CategoryId { get; set; }

//         [JsonProperty("ordinal")]
//         public long Ordinal { get; set; }

//         [JsonProperty("tax_ids")]
//         public string[] TaxIds { get; set; }

//         [JsonProperty("variations")]
//         public Welcome[] Variations { get; set; }

//         [JsonProperty("product_type")]
//         public string ProductType { get; set; }

//         [JsonProperty("skip_modifier_screen")]
//         public bool SkipModifierScreen { get; set; }

//         [JsonProperty("ecom_available")]
//         public bool EcomAvailable { get; set; }
//     }

//     public partial class Welcome
//     {
//         [JsonProperty("type")]
//         public string Type { get; set; }

//         [JsonProperty("id")]
//         public string Id { get; set; }

//         [JsonProperty("updated_at")]
//         public DateTimeOffset UpdatedAt { get; set; }

//         [JsonProperty("version")]
//         public long Version { get; set; }

//         [JsonProperty("is_deleted")]
//         public bool IsDeleted { get; set; }

//         [JsonProperty("present_at_all_locations")]
//         public bool PresentAtAllLocations { get; set; }

//         [JsonProperty("image_id", NullValueHandling = NullValueHandling.Ignore)]
//         public string ImageId { get; set; }

//         [JsonProperty("item_data", NullValueHandling = NullValueHandling.Ignore)]
//         public ItemData ItemData { get; set; }

//         [JsonProperty("item_variation_data", NullValueHandling = NullValueHandling.Ignore)]
//         public ItemVariationData ItemVariationData { get; set; }
//     }

//     public partial class ItemVariationData
//     {
//         [JsonProperty("item_id")]
//         public string ItemId { get; set; }

//         [JsonProperty("name")]
//         public string Name { get; set; }

//         [JsonProperty("sku")]
//         public string Sku { get; set; }

//         [JsonProperty("ordinal")]
//         public long Ordinal { get; set; }

//         [JsonProperty("pricing_type")]
//         public string PricingType { get; set; }

//         [JsonProperty("price_money")]
//         public PriceMoney PriceMoney { get; set; }

//         [JsonProperty("location_overrides", NullValueHandling = NullValueHandling.Ignore)]
//         public LocationOverride[] LocationOverrides { get; set; }
//     }

//     public partial class LocationOverride
//     {
//         [JsonProperty("location_id")]
//         public string LocationId { get; set; }

//         [JsonProperty("track_inventory")]
//         public bool TrackInventory { get; set; }
//     }

//     public partial class PriceMoney
//     {
//         [JsonProperty("amount")]
//         public long Amount { get; set; }

//         [JsonProperty("currency")]
//         public string Currency { get; set; }
//     }
// }
