import 'package:cash_books/core/widgets/custom_snackbar.dart';
import 'package:cash_books/datasource/remote/models/api_response.dart';
import 'package:cash_books/features/businessteam/model/AddBookAccessResponse.dart';
import 'package:cash_books/features/businessteam/model/ChangeBookRoleResponse.dart';
import 'package:cash_books/features/businessteam/model/ChangeRoleResponse.dart';
import 'package:cash_books/features/businessteam/model/GetAllBookAccessListUserWishResponse.dart';
import 'package:cash_books/features/businessteam/model/RemoveBookAccessResponse.dart';
import 'package:cash_books/features/businessteam/model/RemoveTeamMemberResponse.dart';
import 'package:get/get.dart' as g;
import 'package:cash_books/features/businessteam/business_team_handel_veiw_screen.dart';
import 'package:cash_books/features/businessteam/business_team_screen.dart';
import 'package:cash_books/features/businessteam/model/AddTeamMember.dart';
import 'package:cash_books/features/businessteam/repository/business_team_repo.dart';
import 'package:get/get.dart';
import 'package:cash_books/features/businessteam/model/GetTeamMember.dart' as businessteam_model;

import '../model/GetTeamMember.dart';


class BusinessTeamController extends GetxController implements GetxService {
  final BusinessTeamRepo businessTeamRepo;

  BusinessTeamController({required this.businessTeamRepo});

  List<TeamMember> _businessTeam = [];
  List<TeamMember> get businessTeam => _businessTeam;

  List <AllBooks> _books = [];
  List<AllBooks> get books => _books;


  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isLoadingbtn = false;
  bool get isLoadingbtn => _isLoadingbtn;

  String errorMsg = "";

  int currentPage = 1;
  int lastPage = 1;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  set isLoadingbtn(bool value) {
    _isLoadingbtn = value;
    update();
  }

  Future<void> addTeamMember({
    required String email,
    required int businessId,
    required String role
  }) async {
    _isLoading = true;
    update();

    ApiResponse apiResponse = await businessTeamRepo.addTeamMember(email: email, businessId: businessId, role: role);

    if ((apiResponse.response?.statusCode ?? -1) == 200 ||
        (apiResponse.response?.statusCode ?? -1) == 201) {
      AddTeamMember categoryResponse =
      AddTeamMember.fromJson(apiResponse.response?.data);
      String msg = categoryResponse.message ?? "";
      showCustomSnackBar(msg, isError: false, isPosition: true);
      // await allCategory(bookId: bookId);//new added
      Get.off(() => BusinessTeamHandelViewScreen(businessId: businessId));

      update();
      // g.Get.to(AddCashInEntryScreen(bookId: bookId));

    } else {
      errorMsg = apiResponse.error.toString();
      showCustomSnackBar(errorMsg, isError: true);
    }

    _isLoading = false;
    update();
  }

  //get all team member
  Future<void> getTeamMember({required int businessId}) async {
    isLoadingbtn = true;

    ApiResponse apiResponse = await businessTeamRepo.getTeamMember(
        businessId: businessId
    );

    if (apiResponse.response != null &&
        (apiResponse.response!.statusCode == 200)) {
      try {
        BusinessTeamResponse businessTeamResponse =
        BusinessTeamResponse.fromJson(apiResponse.response!.data);

        if (businessTeamResponse.data != null) {
          _businessTeam = businessTeamResponse.data ?? [];
         // _businessTeam.addAll(businessTeamResponse.data ?? []);
          showCustomSnackBar(
              businessTeamResponse.message ?? "Success",
              isError: false,
              isPosition: true
          );
          update();
        }
      } catch (e) {
        showCustomSnackBar(apiResponse.error.toString(), isError: true);
      }
    } else {
      errorMsg = apiResponse.error ?? "Unknown error occurred";
      showCustomSnackBar(errorMsg, isError: true);
    }

    isLoadingbtn = false;
  }

  //change Team role
  Future<void> changeRole({
    required int userId,
    required int businessId,
    required String role
  }) async {
    _isLoading = true;
    update();

    ApiResponse apiResponse = await businessTeamRepo.changeRole(userId: userId, businessId: businessId, role: role);

    if ((apiResponse.response?.statusCode ?? -1) == 200 ||
        (apiResponse.response?.statusCode ?? -1) == 201) {
      ChangeRoleResponse changeRoleResponse =
      ChangeRoleResponse.fromJson(apiResponse.response?.data);
      String msg = changeRoleResponse.message ?? "";
      showCustomSnackBar(msg, isError: false, isPosition: true);
      // await allCategory(bookId: bookId);//new added
      await allBookAccessListUserWish(businessId: businessId, userId: userId);


     // Get.off(() => BusinessTeamHandelViewScreen(businessId: businessId));

      update();
      // g.Get.to(AddCashInEntryScreen(bookId: bookId));

    } else {
      errorMsg = apiResponse.error.toString();
      showCustomSnackBar(errorMsg, isError: true);
    }

    _isLoading = false;
    update();
  }

  //Remove Team Member
  Future<void> removeTeamMember({
    required int userId,
    required int businessId,
  }) async {
    _isLoading = true;
    update();

    ApiResponse apiResponse = await businessTeamRepo.removeTeamMember(userId: userId, businessId: businessId,);

    if ((apiResponse.response?.statusCode ?? -1) == 200 ||
        (apiResponse.response?.statusCode ?? -1) == 201) {
      RemoveTeamMemberResponse removeTeamMemberResponse =
      RemoveTeamMemberResponse.fromJson(apiResponse.response?.data);
      String msg = removeTeamMemberResponse.message ?? "";
      showCustomSnackBar(msg, isError: false, isPosition: true);
      // await allCategory(bookId: bookId);//new added
      await getTeamMember(businessId: businessId);

       Get.off(() => BusinessTeamHandelViewScreen(businessId: businessId));

      update();
      // g.Get.to(AddCashInEntryScreen(bookId: bookId));

    } else {
      errorMsg = apiResponse.error.toString();
      showCustomSnackBar(errorMsg, isError: true);
    }

    _isLoading = false;
    update();
  }

  //get all book access list user wish
  Future<void> allBookAccessListUserWish({required int businessId,required int userId}) async {
    isLoadingbtn = true;

    ApiResponse apiResponse = await businessTeamRepo.allBookAccessListUserWish(
        businessId: businessId, userId: userId
    );

    if (apiResponse.response != null &&
        (apiResponse.response!.statusCode == 200)) {
      try {
        GetAllBookAccessListUserWishResponse getAllBookAccessListUserWishResponse =
        GetAllBookAccessListUserWishResponse.fromJson(apiResponse.response!.data);

        if (getAllBookAccessListUserWishResponse.data != null) {
          _books = getAllBookAccessListUserWishResponse.data?.books ?? [];
          // _businessTeam.addAll(businessTeamResponse.data ?? []);
          showCustomSnackBar(
              getAllBookAccessListUserWishResponse.message ?? "Success",
              isError: false,
              isPosition: true
          );
          update();
        }
      } catch (e) {
        showCustomSnackBar(apiResponse.error.toString(), isError: true);
      }
    } else {
      errorMsg = apiResponse.error ?? "Unknown error occurred";
      showCustomSnackBar(errorMsg, isError: true);
    }

    isLoadingbtn = false;
  }

  //add book access
  Future<void> addBookAccess({
    required int userId,
    required int businessId,
    required int bookId,
    required String role,

  }) async {
    _isLoading = true;
    update();

    ApiResponse apiResponse = await businessTeamRepo.addBookAccess(userId: userId, businessId: businessId, role: role, bookId: bookId);

    if ((apiResponse.response?.statusCode ?? -1) == 200 ||
        (apiResponse.response?.statusCode ?? -1) == 201) {
      AddBookAccessResponse addBookAccessResponse =
      AddBookAccessResponse.fromJson(apiResponse.response?.data);
      String msg = addBookAccessResponse.message ?? "";
      showCustomSnackBar(msg, isError: false, isPosition: true);
      // await allCategory(bookId: bookId);//new added
      await allBookAccessListUserWish(businessId: businessId, userId: userId);

      // Get.off(() => BusinessTeamHandelViewScreen(businessId: businessId));

      update();
      // g.Get.to(AddCashInEntryScreen(bookId: bookId));

    } else {
      errorMsg = apiResponse.error.toString();
      showCustomSnackBar(errorMsg, isError: true);
    }

    _isLoading = false;
    update();
  }

  //change Book role
  Future<void> changeBookRole({
    required int userId,
    required int businessId,
    required String role,
    required int bookId
  }) async {
    _isLoading = true;
    update();

    ApiResponse apiResponse = await businessTeamRepo.changeBookRole(userId: userId, businessId: businessId, role: role, bookId: bookId);

    if ((apiResponse.response?.statusCode ?? -1) == 200 ||
        (apiResponse.response?.statusCode ?? -1) == 201) {
      ChangeBookRoleResponse changeBookRoleResponse =
      ChangeBookRoleResponse.fromJson(apiResponse.response?.data);
      String msg = changeBookRoleResponse.message ?? "";
      showCustomSnackBar(msg, isError: false, isPosition: true);
      // await allCategory(bookId: bookId);//new added
      await allBookAccessListUserWish(businessId: businessId, userId: userId);

      // Get.off(() => BusinessTeamHandelViewScreen(businessId: businessId));

      update();
      // g.Get.to(AddCashInEntryScreen(bookId: bookId));

    } else {
      errorMsg = apiResponse.error.toString();
      showCustomSnackBar(errorMsg, isError: true);
    }

    _isLoading = false;
    update();
  }

  //delete book access
  Future<void> deleteBookAccess({required int bookId,required int businessId,required int userId}) async {
    isLoading = true;
    update();

    ApiResponse apiResponse = await businessTeamRepo.deleteBookAccess(userId: userId, businessId: businessId, bookId: bookId);
    if ((apiResponse.response?.statusCode ?? -1) == 200) {
      RemoveBookAccessResponse removeBookAccessResponse =
      RemoveBookAccessResponse.fromJson(apiResponse.response?.data);

      String msg = removeBookAccessResponse.message ?? "";
      showCustomSnackBar(msg, isError: false, isPosition: true);


      await allBookAccessListUserWish( businessId: businessId, userId: userId);
      update();

    } else {
      errorMsg = apiResponse.error.toString();
      showCustomSnackBar(errorMsg, isError: true);
    }

    isLoading = false;
    update();
  }


}