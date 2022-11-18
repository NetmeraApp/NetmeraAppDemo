/*
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/* Automatically generated nanopb constant definitions */
/* Generated by nanopb-0.3.9.8 */

#include "index.nanopb.h"

#include "Firestore/core/src/nanopb/pretty_printing.h"

namespace firebase {
namespace firestore {

using nanopb::PrintEnumField;
using nanopb::PrintHeader;
using nanopb::PrintMessageField;
using nanopb::PrintPrimitiveField;
using nanopb::PrintTail;

/* @@protoc_insertion_point(includes) */
#if PB_PROTO_HEADER_VERSION != 30
#error Regenerate this file with the current version of nanopb generator.
#endif



const pb_field_t google_firestore_admin_v1_Index_fields[5] = {
    PB_FIELD(  1, BYTES   , SINGULAR, POINTER , FIRST, google_firestore_admin_v1_Index, name, name, 0),
    PB_FIELD(  2, UENUM   , SINGULAR, STATIC  , OTHER, google_firestore_admin_v1_Index, query_scope, name, 0),
    PB_FIELD(  3, MESSAGE , REPEATED, POINTER , OTHER, google_firestore_admin_v1_Index, fields, query_scope, &google_firestore_admin_v1_Index_IndexField_fields),
    PB_FIELD(  4, UENUM   , SINGULAR, STATIC  , OTHER, google_firestore_admin_v1_Index, state, fields, 0),
    PB_LAST_FIELD
};

const pb_field_t google_firestore_admin_v1_Index_IndexField_fields[4] = {
    PB_FIELD(  1, BYTES   , SINGULAR, POINTER , FIRST, google_firestore_admin_v1_Index_IndexField, field_path, field_path, 0),
    PB_ANONYMOUS_ONEOF_FIELD(value_mode,   2, UENUM   , ONEOF, STATIC  , OTHER, google_firestore_admin_v1_Index_IndexField, order, field_path, 0),
    PB_ANONYMOUS_ONEOF_FIELD(value_mode,   3, UENUM   , ONEOF, STATIC  , UNION, google_firestore_admin_v1_Index_IndexField, array_config, field_path, 0),
    PB_LAST_FIELD
};






const char* EnumToString(
  google_firestore_admin_v1_Index_QueryScope value) {
    switch (value) {
    case google_firestore_admin_v1_Index_QueryScope_QUERY_SCOPE_UNSPECIFIED:
        return "QUERY_SCOPE_UNSPECIFIED";
    case google_firestore_admin_v1_Index_QueryScope_COLLECTION:
        return "COLLECTION";
    case google_firestore_admin_v1_Index_QueryScope_COLLECTION_GROUP:
        return "COLLECTION_GROUP";
    }
    return "<unknown enum value>";
}

const char* EnumToString(
  google_firestore_admin_v1_Index_State value) {
    switch (value) {
    case google_firestore_admin_v1_Index_State_STATE_UNSPECIFIED:
        return "STATE_UNSPECIFIED";
    case google_firestore_admin_v1_Index_State_CREATING:
        return "CREATING";
    case google_firestore_admin_v1_Index_State_READY:
        return "READY";
    case google_firestore_admin_v1_Index_State_NEEDS_REPAIR:
        return "NEEDS_REPAIR";
    }
    return "<unknown enum value>";
}

const char* EnumToString(
  google_firestore_admin_v1_Index_IndexField_Order value) {
    switch (value) {
    case google_firestore_admin_v1_Index_IndexField_Order_ORDER_UNSPECIFIED:
        return "ORDER_UNSPECIFIED";
    case google_firestore_admin_v1_Index_IndexField_Order_ASCENDING:
        return "ASCENDING";
    case google_firestore_admin_v1_Index_IndexField_Order_DESCENDING:
        return "DESCENDING";
    }
    return "<unknown enum value>";
}

const char* EnumToString(
  google_firestore_admin_v1_Index_IndexField_ArrayConfig value) {
    switch (value) {
    case google_firestore_admin_v1_Index_IndexField_ArrayConfig_ARRAY_CONFIG_UNSPECIFIED:
        return "ARRAY_CONFIG_UNSPECIFIED";
    case google_firestore_admin_v1_Index_IndexField_ArrayConfig_CONTAINS:
        return "CONTAINS";
    }
    return "<unknown enum value>";
}

std::string google_firestore_admin_v1_Index::ToString(int indent) const {
    std::string tostring_header = PrintHeader(indent, "Index", this);
    std::string tostring_result;

    tostring_result += PrintPrimitiveField("name: ", name, indent + 1, false);
    tostring_result += PrintEnumField("query_scope: ",
        query_scope, indent + 1, false);
    for (pb_size_t i = 0; i != fields_count; ++i) {
        tostring_result += PrintMessageField("fields ",
            fields[i], indent + 1, true);
    }
    tostring_result += PrintEnumField("state: ", state, indent + 1, false);

    bool is_root = indent == 0;
    if (!tostring_result.empty() || is_root) {
      std::string tostring_tail = PrintTail(indent);
      return tostring_header + tostring_result + tostring_tail;
    } else {
      return "";
    }
}

std::string google_firestore_admin_v1_Index_IndexField::ToString(int indent) const {
    std::string tostring_header = PrintHeader(indent, "IndexField", this);
    std::string tostring_result;

    tostring_result += PrintPrimitiveField("field_path: ",
        field_path, indent + 1, false);
    switch (which_value_mode) {
    case google_firestore_admin_v1_Index_IndexField_order_tag:
        tostring_result += PrintEnumField("order: ", order, indent + 1, true);
        break;
    case google_firestore_admin_v1_Index_IndexField_array_config_tag:
        tostring_result += PrintEnumField("array_config: ",
            array_config, indent + 1, true);
        break;
    }

    bool is_root = indent == 0;
    if (!tostring_result.empty() || is_root) {
      std::string tostring_tail = PrintTail(indent);
      return tostring_header + tostring_result + tostring_tail;
    } else {
      return "";
    }
}

}  // namespace firestore
}  // namespace firebase

/* @@protoc_insertion_point(eof) */
