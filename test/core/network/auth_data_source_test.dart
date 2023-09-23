import 'package:anime_tracker/core/common/global_static_constants.dart';
import 'package:anime_tracker/core/network/auth_data_source.dart';
import 'package:anime_tracker/core/shared_preference/user_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('auth_data_source_test', () {
    late AuthDataSource authDataSource;
    setUp(() async {
      isUnitTest = true;
      SharedPreferences.setMockInitialValues({});
      await AniFlowPreferences().init();
      authDataSource = AuthDataSource();
      authDataSource.setTestToken('eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjBlMzk4NWRiYWZmODQ4MzYzMTZkOTNiNmJhNzMxZjQwZmM2ZTIzZDBmNGY3OWYwMWFlNTdhZWZjNTIzNjRiNmY1MjgxYWUwY2Q0Yzg1OTlhIn0.eyJhdWQiOiIxNDQwOSIsImp0aSI6IjBlMzk4NWRiYWZmODQ4MzYzMTZkOTNiNmJhNzMxZjQwZmM2ZTIzZDBmNGY3OWYwMWFlNTdhZWZjNTIzNjRiNmY1MjgxYWUwY2Q0Yzg1OTlhIiwiaWF0IjoxNjk0MzI3MzMwLCJuYmYiOjE2OTQzMjczMzAsImV4cCI6MTcyNTk0OTczMCwic3ViIjoiNjM3ODM5MyIsInNjb3BlcyI6W119.ZpLKicB2ylvG84w6DUMURTHUv6x9nGX2LAxE1lncdGxN6by9rZtGygv2TAey2cgZgjRYTIKFFIVEVCQdGh7Vbc1bYFHaCqs8B3nUOeKBr_cZ52LsQxn4b8664e2mz87aE9XszxgYDYjsL_9WfBvetzzJOkltyN60o4YJ3eyKFtrW9a1M2pkw9IJ55XSzW8t94aloSMvb4gtyimWDdJDmMi1WDbcTmxy9EZHGi5c1c6Ob8om5SUvA7m-ew0Apxp2QWqTycN-mNxLTc0hZdudF3MDE1aVuDPPW4meFpOmoancebWj5UGa0Z3-vVyIvR-TM2uEfLhzAw5WDJ4NE8Vyfx9BGWVWYZSyZE6GD9uC7bizsqlreq5keixPV8fbrxhvU-TMoy3ip-H26h_xjvT7lUpv-WKVCVX6gTzgPqUVY1PRUr8cJJo-iaiKeuhfBzAdHbc6C9r2nFOxh41iyRwgcFwteMINxuBJvu79rnKAuPYMgExd_dzLeQQ6h7CgUm-NTlU0EMjBMCZL6wsuT0rrsFNG27wtoBAp6PPoOdAMIN0nSzXbxTpABk4ZuUGSa98rxcKcyWpN23E0Sn54PK3sU2WM9_c2dVQsVua6_u58TvM154CWqkXhlTva-47mHuIAymFgQOmCZ9cJE13VEVKKgyvbGznCpeLdh4wninq3C_f0');
    });

    test('get_auth_data', () async {
      await authDataSource.getUserDataDto();
    });
  });
}
