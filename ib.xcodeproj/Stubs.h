// Generated by IB v0.3.1 gem. Do not edit it manually
// Run `rake ib:open` to refresh

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>

@interface ParserError: StandardError







@end


@interface NSNotificationCenter





-(IBAction) observers;
-(IBAction) unobserve:(id) observer;

@end


@interface NSURLRequest





-(IBAction) to_s;

@end


@interface InvalidURLError: StandardError







@end


@interface InvalidFileError: StandardError







@end


@interface BubbleWrap





-(IBAction) to_s;
-(IBAction) connectionDidFinishLoading:(id) connection;
-(IBAction) show_status_indicator:(id) show;
-(IBAction) create_request;
-(IBAction) set_content_type;
-(IBAction) create_request_body;
-(IBAction) append_payload:(id) body;
-(IBAction) append_form_params:(id) body;
-(IBAction) append_auth_header;
-(IBAction) append_files:(id) body;
-(IBAction) append_body_boundary:(id) body;
-(IBAction) create_url:(id) url_string;
-(IBAction) validate_url:(id) url;
-(IBAction) escape:(id) string;
-(IBAction) convert_payload_to_url;
-(IBAction) log:(id) message;
-(IBAction) escape_line_feeds:(id) hash;
-(IBAction) patch_nsurl_request:(id) request;
-(IBAction) call_delegator_with_response;

@end


@interface BubbleWrap





-(IBAction) initialize:(id) values;
-(IBAction) update:(id) values;
-(IBAction) to_s;
-(IBAction) update_status_description;

@end


@interface ValidationSpecificationError: RuntimeError







@end


@interface RecordInvalid: RuntimeError





-(IBAction) validations;
-(IBAction) do_insert:(id) options;
-(IBAction) do_update:(id) options;
-(IBAction) error_messages;
-(IBAction) error_messages_for:(id) field;
-(IBAction) validate_each:(id) validations;
-(IBAction) validation_method:(id) validation_type;
-(IBAction) each_validation_for:(id) field;

@end


@interface Model





-(IBAction) cast_to_bool:(id) arg;
-(IBAction) cast_to_integer:(id) arg;
-(IBAction) cast_to_float:(id) arg;
-(IBAction) cast_to_date:(id) arg;
-(IBAction) cast_to_array:(id) arg;
-(IBAction) cast_to_hash:(id) arg;
-(IBAction) cast_to_string:(id) arg;

@end


@interface PersistFileError: Exception





-(IBAction) new:(id) options;

@end


@interface RelationIsNilError: Exception





-(IBAction) new:(id) options;

@end


@interface AdapterNotFoundError: Exception





-(IBAction) new:(id) options;

@end


@interface RecordNotSaved: Exception





-(IBAction) new:(id) options;
-(IBAction) column_type:(id) col;
-(IBAction) column:(id) col;
-(IBAction) has_many_columns;
-(IBAction) has_one_columns;
-(IBAction) belongs_to_columns;
-(IBAction) association_columns;
-(IBAction) default:(id) col;
-(IBAction) read:(id) attrs;
-(IBAction) create:(id) options;
-(IBAction) destroy_all;
-(IBAction) config;
-(IBAction) column_from_hash:(id) hash;
-(IBAction) column_from_string_or_sym:(id) string;
-(IBAction) define_belongs_to_methods:(id) name;
-(IBAction) define_has_many_methods:(id) name;
-(IBAction) define_has_one_methods:(id) name;
-(IBAction) column_as:(id) col;
-(IBAction) initialize:(id) options;
-(IBAction) object_identifier;
-(IBAction) model_identifier;
-(IBAction) attributes;
-(IBAction) update_attributes:(id) attrs;
-(IBAction) read_attribute:(id) name;
-(IBAction) to_i;
-(IBAction) inspect;
-(IBAction) to_s;
-(IBAction) save:(id) options;
-(IBAction) save_without_transaction:(id) options;
-(IBAction) set_auto_date_field:(id) field_name;
-(IBAction) delete:(id) options;
-(IBAction) destroy:(id) options;
-(IBAction) columns;
-(IBAction) options:(id) col;
-(IBAction) set_dirty;
-(IBAction) get_attr:(id) name;
-(IBAction) get_belongs_to_attr:(id) col;
-(IBAction) get_has_many_attr:(id) col;
-(IBAction) get_has_one_attr:(id) col;
-(IBAction) get_polymorphic_attr:(id) col;
-(IBAction) foreign_column_name:(id) col;
-(IBAction) unload_relation:(id) col;
-(IBAction) issue_notification:(id) info;

@end


@interface Column





-(IBAction) class_name;
-(IBAction) primary_key;
-(IBAction) foreign_name;
-(IBAction) foreign_polymorphic_type;
-(IBAction) foreign_key;
-(IBAction) classify;
-(IBAction) class_const_get;
-(IBAction) through_class;
-(IBAction) inverse_foreign_key;
-(IBAction) inverse_name;
-(IBAction) inverse_column;

@end


@interface ModelNotSetError: RuntimeError







@end


@interface FieldBindingMap





-(IBAction) initialize:(id) options;
-(IBAction) model:(id) model_instance;
-(IBAction) field_count;
-(IBAction) field_at:(id) index;
-(IBAction) value_at:(id) field;
-(IBAction) fields;
-(IBAction) bind;
-(IBAction) textFieldShouldReturn:(id) textField;
-(IBAction) handle_keyboard_will_show:(id) notification;
-(IBAction) owner_cell_index_path;
-(IBAction) handle_keyboard_will_hide:(id) notification;
-(IBAction) find_first_responder:(id) parent;

@end


@interface String





-(IBAction) humanize;
-(IBAction) titleize;
-(IBAction) pluralize;
-(IBAction) singularize;
-(IBAction) camelize:(id) uppercase_first_letter;
-(IBAction) underscore;
-(IBAction) initialize;
-(IBAction) reset;

@end


@interface Inflector





-(IBAction) initialize;
-(IBAction) reset;
-(IBAction) uncountable:(id) word;
-(IBAction) singularize:(id) word;
-(IBAction) pluralize:(id) word;
-(IBAction) titleize;

@end


@interface NilClass





-(IBAction) titleize;
-(IBAction) deep_const_get:(id) const;

@end


@interface Array





-(IBAction) titleize;
-(IBAction) deep_const_get:(id) const;

@end


@interface Hash





-(IBAction) titleize;
-(IBAction) deep_const_get:(id) const;

@end


@interface Symbol





-(IBAction) titleize;
-(IBAction) deep_const_get:(id) const;

@end


@interface Ansi





-(IBAction) deep_const_get:(id) const;

@end


@interface Debug





-(IBAction) deep_const_get:(id) const;

@end


@interface Module





-(IBAction) deep_const_get:(id) const;

@end


@interface String





-(IBAction) to_date;
-(IBAction) to_timezone;
-(IBAction) to_duration;

@end


@interface PersistFileError: Exception







@end


@interface VersionNumberError: ArgumentError





-(IBAction) validate_schema_version:(id) version_number;
-(IBAction) migrate;
-(IBAction) deserialize_from_file:(id) file_name;
-(IBAction) serialize_to_file:(id) file_name;
-(IBAction) documents_file:(id) file_name;
-(IBAction) initWithCoder:(id) coder;
-(IBAction) encodeWithCoder:(id) coder;

@end


@interface ArrayFinderQuery





-(IBAction) and:(id) field_name;
-(IBAction) in:(id) set;
-(IBAction) all;
-(IBAction) to_a;
-(IBAction) length;
-(IBAction) create:(id) options;
-(IBAction) new:(id) options;
-(IBAction) push:(id) object;

@end


@interface Constraint





-(IBAction) attribute;
-(IBAction) attribute2;
-(IBAction) times:(id) multiplier;
-(IBAction) divided_by:(id) multiplier;
-(IBAction) plus:(id) constant;
-(IBAction) minus:(id) constant;
-(IBAction) priority:(id) priority;
-(IBAction) copy;
-(IBAction) inspect;
-(IBAction) nslayoutconstraint;
-(IBAction) attribute_lookup:(id) attribute;
-(IBAction) priority_lookup:(id) priority;
-(IBAction) relationship_lookup:(id) relationship;
-(IBAction) attribute_reverse:(id) attribute;
-(IBAction) relationship_reverse:(id) relationship;

@end


@interface Stylesheet





-(IBAction) stylesheets;
-(IBAction) stylesheet_cache;
-(IBAction) import:(id) name_or_stylesheet;
-(IBAction) run_block;
-(IBAction) inspect;
-(IBAction) imported_stylesheets;
-(IBAction) exclude_instance_vars;
-(IBAction) import_instance_vars:(id) from_stylesheet;
-(IBAction) imported;
-(IBAction) styles;

@end


@interface Stylesheet





-(IBAction) constrain_left:(id) x;
-(IBAction) constrain_right:(id) x;
-(IBAction) constrain_center_x:(id) x;
-(IBAction) constrain_top:(id) y;
-(IBAction) constrain_bottom:(id) y;
-(IBAction) constrain_center_y:(id) y;
-(IBAction) constrain_width:(id) width;
-(IBAction) constrain_height:(id) height;

@end


@interface Stylesheet





-(IBAction) pi;
-(IBAction) transform_view;
-(IBAction) transform_layer;
-(IBAction) identity;

@end


@interface TransformLayer





-(IBAction) identity;
-(IBAction) flip:(id) angle;
-(IBAction) twist:(id) angle;
-(IBAction) spin:(id) angle;
-(IBAction) rotate:(id) angle;

@end


@interface TransformView





-(IBAction) identity;
-(IBAction) rotate:(id) angle;

@end


@interface NSView





-(IBAction) teacup_animation:(id) options;
-(IBAction) apply_style_properties:(id) properties;
-(IBAction) style:(id) properties;
-(IBAction) top_level_view;

@end


@interface NSViewController





-(IBAction) loadView;
-(IBAction) top_level_view;

@end


@interface NSWindow





-(IBAction) teacup_animation:(id) options;
-(IBAction) apply_style_properties:(id) properties;
-(IBAction) style:(id) properties;
-(IBAction) top_level_view;

@end


@interface NSWindowController





-(IBAction) windowDidLoad;
-(IBAction) top_level_view;

@end


@interface TeacupWindowController: NSWindowController





-(IBAction) loadWindow;

@end


@interface DummyView: NSView





-(IBAction) dummy;

@end


@interface DummyTableView: NSTableView





-(IBAction) dummy;

@end


@interface DummyTableColumn: NSTableColumn





-(IBAction) dummy;

@end


@interface DummyButton: NSButton





-(IBAction) dummy;

@end


@interface DummyScrollView: NSScrollView





-(IBAction) dummy;

@end


@interface DummyTextField: NSTextField





-(IBAction) dummy;

@end


@interface DummyTextView: NSTextView





-(IBAction) dummy;

@end


@interface DummyLayer: CALayer





-(IBAction) dummy;

@end


@interface Style: Hash







@end


@interface Stylesheet





-(IBAction) flexible_left;
-(IBAction) flexible_width;
-(IBAction) flexible_right;
-(IBAction) flexible_top;
-(IBAction) flexible_height;
-(IBAction) flexible_bottom;
-(IBAction) none;

@end


@interface Autoresize





-(IBAction) none;
-(IBAction) flexible_left;
-(IBAction) flexible_width;
-(IBAction) flexible_right;
-(IBAction) flexible_top;
-(IBAction) flexible_height;
-(IBAction) flexible_bottom;
-(IBAction) fill;
-(IBAction) fill_top;
-(IBAction) fill_bottom;
-(IBAction) fill_left;
-(IBAction) fill_right;
-(IBAction) fixed_top_left;
-(IBAction) fixed_top_middle;
-(IBAction) fixed_top_right;
-(IBAction) fixed_middle_left;
-(IBAction) fixed_middle;
-(IBAction) fixed_middle_right;
-(IBAction) fixed_bottom_left;
-(IBAction) fixed_bottom_middle;
-(IBAction) fixed_bottom_right;
-(IBAction) float_horizontal;
-(IBAction) float_vertical;

@end


@interface AppDelegate





-(IBAction) applicationDidFinishLaunching:(id) notification;
-(IBAction) buildWindow;

@end


@interface BaseWindowController: NSWindowController





-(IBAction) windowDidLoad;
-(IBAction) window_did_load;
-(IBAction) register_buttons;

@end


@interface Rebase





-(IBAction) remove:(id) commit;
-(IBAction) pick:(id) commit;
-(IBAction) write_to_rebase_file:(id) contents;
-(IBAction) last_commit;
-(IBAction) equivalent_commit:(id) commit;
-(IBAction) after:(id) commit;
-(IBAction) before:(id) commit;
-(IBAction) find_earliest_commit:(id) commits;
-(IBAction) start:(id) commits;
-(IBAction) wait_for_lock;
-(IBAction) read_commits;
-(IBAction) commits;
-(IBAction) sorted_commits;
-(IBAction) finish;
-(IBAction) path;

@end


@interface MainWindowController: BaseWindowController

@property IBOutlet id working_branches;
@property IBOutlet id graph;
@property IBOutlet id node_popover;
@property IBOutlet id reusable_horizontal_node;
@property IBOutlet id reusable_vertical_node;
@property IBOutlet id graph_column;



-(IBAction) window_did_load;
-(IBAction) graph_row_count;
-(IBAction) graph_cell:(id) row;
-(IBAction) graph_column_size:(id) width;
-(IBAction) working_branches_row_count;
-(IBAction) working_branches_cell:(id) row;

@end


@interface AppDelegate





-(IBAction) buildMenu;

@end


@interface Array





-(IBAction) to_rect;

@end


@interface NSObject





-(IBAction) strong:(id) a;
-(IBAction) clear_puts:(id) msg;
-(IBAction) to_obj_c:(id) meth;

@end


@interface NSPopover





-(IBAction) view:(id) identifier;
-(IBAction) show:(id) view;

@end


@interface NSTableView





-(IBAction) make_view:(id) id;

@end


@interface NSTextField





-(IBAction) text;

@end


@interface NSView





-(IBAction) find:(id) identifier;
-(IBAction) auto_arrange_subviews;
-(IBAction) left;

@end


@interface CommitNode: NSView





-(IBAction) reuse:(id) options;
-(IBAction) commit;
-(IBAction) popover;
-(IBAction) node_view;

@end


@interface NodeButton: NSButton







@end


@interface NodePopover: NSPopover





-(IBAction) show:(id) sender;

@end


@interface TableDelegateProxy





-(IBAction) numberOfRowsInTableView:(id) table_view;
-(IBAction) connect_delegation;

@end



