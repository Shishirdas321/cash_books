import 'dart:convert';
/// success : true
/// message : "User books retrieved successfully"
/// data : {"user_id":36,"business_id":9,"total_books":22,"accessible_books":0,"books":[{"id":8,"business_id":9,"name":"A4B Business","balance":"3680.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-18T11:38:15.000000Z","updated_at":"2025-10-08T13:04:52.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"660.00","total_cash_out":"0.00","net_amount":"660.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":7,"business_id":9,"name":"Business books","balance":"90.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-18T11:35:45.000000Z","updated_at":"2025-11-04T06:22:09.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"140.00","total_cash_out":"50.00","net_amount":"90.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":5,"business_id":9,"name":"Cash","balance":"1000.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-18T11:01:47.000000Z","updated_at":"2025-08-19T08:17:47.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":30,"business_id":9,"name":"Cash Book","balance":"1000.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-10-12T07:58:57.000000Z","updated_at":"2025-10-12T07:58:57.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":31,"business_id":9,"name":"Cash Book","balance":"1000.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-10-14T10:59:55.000000Z","updated_at":"2025-10-14T10:59:55.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":6,"business_id":9,"name":"FANTA","balance":"0.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-18T11:32:34.000000Z","updated_at":"2025-08-19T17:25:34.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":24,"business_id":9,"name":"five","balance":"0.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-26T10:09:09.000000Z","updated_at":"2025-08-26T10:09:09.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":23,"business_id":9,"name":"four","balance":"0.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-26T10:09:03.000000Z","updated_at":"2025-08-26T10:09:03.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":19,"business_id":9,"name":"life okay","balance":"0.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-26T09:57:43.000000Z","updated_at":"2025-08-26T09:57:43.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":29,"business_id":9,"name":"michael book","balance":"0.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-09-05T16:50:09.000000Z","updated_at":"2025-09-05T16:50:09.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":26,"business_id":9,"name":"okl","balance":"0.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-26T10:26:21.000000Z","updated_at":"2025-08-26T10:26:21.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":20,"business_id":9,"name":"one","balance":"0.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-26T09:59:01.000000Z","updated_at":"2025-08-26T09:59:01.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":14,"business_id":9,"name":"Ostad","balance":"0.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-19T12:21:32.000000Z","updated_at":"2025-08-19T12:21:32.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":11,"business_id":9,"name":"PARTEX","balance":"0.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-18T12:32:21.000000Z","updated_at":"2025-08-18T12:32:21.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":28,"business_id":9,"name":"test","balance":"0.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-09-05T16:49:37.000000Z","updated_at":"2025-09-05T16:49:37.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":22,"business_id":9,"name":"three","balance":"0.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-26T10:05:09.000000Z","updated_at":"2025-08-26T10:05:09.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":9,"business_id":9,"name":"Top Business","balance":"2000.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-18T12:00:08.000000Z","updated_at":"2025-09-02T05:27:36.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":21,"business_id":9,"name":"two","balance":"0.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-26T10:00:20.000000Z","updated_at":"2025-08-26T10:00:20.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":1,"business_id":9,"name":"Updated Cash Book","balance":"1000.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-14T06:09:20.000000Z","updated_at":"2025-08-20T05:26:03.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":18,"business_id":9,"name":"Zebra","balance":"0.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-26T06:44:25.000000Z","updated_at":"2025-08-26T06:44:25.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":25,"business_id":9,"name":"Zebra","balance":"0.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-26T10:25:49.000000Z","updated_at":"2025-08-26T10:25:49.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":27,"business_id":9,"name":"zebra","balance":"0.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-26T10:26:52.000000Z","updated_at":"2025-08-26T10:26:52.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}}]}

GetAllBookAccessListUserWishResponse getAllBookAccessListUserWishResponseFromJson(String str) => GetAllBookAccessListUserWishResponse.fromJson(json.decode(str));
String getAllBookAccessListUserWishResponseToJson(GetAllBookAccessListUserWishResponse data) => json.encode(data.toJson());
class GetAllBookAccessListUserWishResponse {
  GetAllBookAccessListUserWishResponse({
      this.success, 
      this.message, 
      this.data,});

  GetAllBookAccessListUserWishResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? success;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// user_id : 36
/// business_id : 9
/// total_books : 22
/// accessible_books : 0
/// books : [{"id":8,"business_id":9,"name":"A4B Business","balance":"3680.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-18T11:38:15.000000Z","updated_at":"2025-10-08T13:04:52.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"660.00","total_cash_out":"0.00","net_amount":"660.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":7,"business_id":9,"name":"Business books","balance":"90.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-18T11:35:45.000000Z","updated_at":"2025-11-04T06:22:09.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"140.00","total_cash_out":"50.00","net_amount":"90.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":5,"business_id":9,"name":"Cash","balance":"1000.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-18T11:01:47.000000Z","updated_at":"2025-08-19T08:17:47.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":30,"business_id":9,"name":"Cash Book","balance":"1000.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-10-12T07:58:57.000000Z","updated_at":"2025-10-12T07:58:57.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":31,"business_id":9,"name":"Cash Book","balance":"1000.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-10-14T10:59:55.000000Z","updated_at":"2025-10-14T10:59:55.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":6,"business_id":9,"name":"FANTA","balance":"0.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-18T11:32:34.000000Z","updated_at":"2025-08-19T17:25:34.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":24,"business_id":9,"name":"five","balance":"0.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-26T10:09:09.000000Z","updated_at":"2025-08-26T10:09:09.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":23,"business_id":9,"name":"four","balance":"0.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-26T10:09:03.000000Z","updated_at":"2025-08-26T10:09:03.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":19,"business_id":9,"name":"life okay","balance":"0.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-26T09:57:43.000000Z","updated_at":"2025-08-26T09:57:43.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":29,"business_id":9,"name":"michael book","balance":"0.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-09-05T16:50:09.000000Z","updated_at":"2025-09-05T16:50:09.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":26,"business_id":9,"name":"okl","balance":"0.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-26T10:26:21.000000Z","updated_at":"2025-08-26T10:26:21.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":20,"business_id":9,"name":"one","balance":"0.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-26T09:59:01.000000Z","updated_at":"2025-08-26T09:59:01.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":14,"business_id":9,"name":"Ostad","balance":"0.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-19T12:21:32.000000Z","updated_at":"2025-08-19T12:21:32.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":11,"business_id":9,"name":"PARTEX","balance":"0.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-18T12:32:21.000000Z","updated_at":"2025-08-18T12:32:21.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":28,"business_id":9,"name":"test","balance":"0.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-09-05T16:49:37.000000Z","updated_at":"2025-09-05T16:49:37.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":22,"business_id":9,"name":"three","balance":"0.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-26T10:05:09.000000Z","updated_at":"2025-08-26T10:05:09.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":9,"business_id":9,"name":"Top Business","balance":"2000.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-18T12:00:08.000000Z","updated_at":"2025-09-02T05:27:36.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":21,"business_id":9,"name":"two","balance":"0.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-26T10:00:20.000000Z","updated_at":"2025-08-26T10:00:20.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":1,"business_id":9,"name":"Updated Cash Book","balance":"1000.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-14T06:09:20.000000Z","updated_at":"2025-08-20T05:26:03.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":18,"business_id":9,"name":"Zebra","balance":"0.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-26T06:44:25.000000Z","updated_at":"2025-08-26T06:44:25.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":25,"business_id":9,"name":"Zebra","balance":"0.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-26T10:25:49.000000Z","updated_at":"2025-08-26T10:25:49.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}},{"id":27,"business_id":9,"name":"zebra","balance":"0.00","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-26T10:26:52.000000Z","updated_at":"2025-08-26T10:26:52.000000Z","access_status":0,"role":null,"is_creator":false,"total_cash_in":"0.00","total_cash_out":"0.00","net_amount":"0.00","business":{"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"},"creator":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"},"updater":{"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}}]

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.userId, 
      this.businessId, 
      this.totalBooks, 
      this.accessibleBooks, 
      this.books,});

  Data.fromJson(dynamic json) {
    userId = json['user_id'];
    businessId = json['business_id'];
    totalBooks = json['total_books'];
    accessibleBooks = json['accessible_books'];
    if (json['books'] != null) {
      books = [];
      json['books'].forEach((v) {
        books?.add(AllBooks.fromJson(v));
      });
    }
  }
  int? userId;
  int? businessId;
  int? totalBooks;
  int? accessibleBooks;
  List<AllBooks>? books;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['business_id'] = businessId;
    map['total_books'] = totalBooks;
    map['accessible_books'] = accessibleBooks;
    if (books != null) {
      map['books'] = books?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 8
/// business_id : 9
/// name : "A4B Business"
/// balance : "3680.00"
/// status : 1
/// created_by : 1
/// updated_by : 1
/// created_at : "2025-08-18T11:38:15.000000Z"
/// updated_at : "2025-10-08T13:04:52.000000Z"
/// access_status : 0
/// role : null
/// is_creator : false
/// total_cash_in : "660.00"
/// total_cash_out : "0.00"
/// net_amount : "660.00"
/// business : {"id":9,"name":"A4B","status":1,"created_by":1,"updated_by":1,"created_at":"2025-08-12T07:01:10.000000Z","updated_at":"2025-08-12T07:01:10.000000Z"}
/// creator : {"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}
/// updater : {"id":1,"first_name":"Tushar","last_name":"Das","email":"tushar2499@gmail.com","phone":"+8801815920898","email_verified_at":null,"created_at":"2025-07-29T10:08:21.000000Z","updated_at":"2025-07-29T10:08:21.000000Z"}

AllBooks booksFromJson(String str) => AllBooks.fromJson(json.decode(str));
String booksToJson(AllBooks data) => json.encode(data.toJson());
class AllBooks {
  AllBooks({
      this.id, 
      this.businessId, 
      this.name, 
      this.balance, 
      this.status, 
      this.createdBy, 
      this.updatedBy, 
      this.createdAt, 
      this.updatedAt, 
      this.accessStatus, 
      this.role, 
      this.isCreator, 
      this.totalCashIn, 
      this.totalCashOut, 
      this.netAmount, 
      this.business, 
      this.creator, 
      this.updater,});

  AllBooks.fromJson(dynamic json) {
    id = json['id'];
    businessId = json['business_id'];
    name = json['name'];
    balance = json['balance'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    accessStatus = json['access_status'];
    role = json['role'];
    isCreator = json['is_creator'];
    totalCashIn = json['total_cash_in'];
    totalCashOut = json['total_cash_out'];
    netAmount = json['net_amount'];
    business = json['business'] != null ? Business.fromJson(json['business']) : null;
    creator = json['creator'] != null ? Creator.fromJson(json['creator']) : null;
    updater = json['updater'] != null ? Updater.fromJson(json['updater']) : null;
  }
  int? id;
  int? businessId;
  String? name;
  String? balance;
  int? status;
  int? createdBy;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;
  int? accessStatus;
  dynamic role;
  bool? isCreator;
  String? totalCashIn;
  String? totalCashOut;
  String? netAmount;
  Business? business;
  Creator? creator;
  Updater? updater;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['business_id'] = businessId;
    map['name'] = name;
    map['balance'] = balance;
    map['status'] = status;
    map['created_by'] = createdBy;
    map['updated_by'] = updatedBy;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['access_status'] = accessStatus;
    map['role'] = role;
    map['is_creator'] = isCreator;
    map['total_cash_in'] = totalCashIn;
    map['total_cash_out'] = totalCashOut;
    map['net_amount'] = netAmount;
    if (business != null) {
      map['business'] = business?.toJson();
    }
    if (creator != null) {
      map['creator'] = creator?.toJson();
    }
    if (updater != null) {
      map['updater'] = updater?.toJson();
    }
    return map;
  }

}

/// id : 1
/// first_name : "Tushar"
/// last_name : "Das"
/// email : "tushar2499@gmail.com"
/// phone : "+8801815920898"
/// email_verified_at : null
/// created_at : "2025-07-29T10:08:21.000000Z"
/// updated_at : "2025-07-29T10:08:21.000000Z"

Updater updaterFromJson(String str) => Updater.fromJson(json.decode(str));
String updaterToJson(Updater data) => json.encode(data.toJson());
class Updater {
  Updater({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.email, 
      this.phone, 
      this.emailVerifiedAt, 
      this.createdAt, 
      this.updatedAt,});

  Updater.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  dynamic emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['phone'] = phone;
    map['email_verified_at'] = emailVerifiedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

/// id : 1
/// first_name : "Tushar"
/// last_name : "Das"
/// email : "tushar2499@gmail.com"
/// phone : "+8801815920898"
/// email_verified_at : null
/// created_at : "2025-07-29T10:08:21.000000Z"
/// updated_at : "2025-07-29T10:08:21.000000Z"

Creator creatorFromJson(String str) => Creator.fromJson(json.decode(str));
String creatorToJson(Creator data) => json.encode(data.toJson());
class Creator {
  Creator({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.email, 
      this.phone, 
      this.emailVerifiedAt, 
      this.createdAt, 
      this.updatedAt,});

  Creator.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  dynamic emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['phone'] = phone;
    map['email_verified_at'] = emailVerifiedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

/// id : 9
/// name : "A4B"
/// status : 1
/// created_by : 1
/// updated_by : 1
/// created_at : "2025-08-12T07:01:10.000000Z"
/// updated_at : "2025-08-12T07:01:10.000000Z"

Business businessFromJson(String str) => Business.fromJson(json.decode(str));
String businessToJson(Business data) => json.encode(data.toJson());
class Business {
  Business({
      this.id, 
      this.name, 
      this.status, 
      this.createdBy, 
      this.updatedBy, 
      this.createdAt, 
      this.updatedAt,});

  Business.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  int? status;
  int? createdBy;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['status'] = status;
    map['created_by'] = createdBy;
    map['updated_by'] = updatedBy;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}