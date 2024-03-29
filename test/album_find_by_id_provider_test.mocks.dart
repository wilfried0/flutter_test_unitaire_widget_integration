// Mocks generated by Mockito 5.4.2 from annotations
// in test_app/test/album_find_by_id_provider_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:flutter_riverpod/flutter_riverpod.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:state_notifier/state_notifier.dart' as _i7;
import 'package:test_app/dto/album_dto.dart' as _i2;
import 'package:test_app/models/album.dart' as _i3;
import 'package:test_app/providers/album_find_by_id_provider.dart' as _i4;
import 'package:test_app/services/impl/album_service_impl.dart' as _i8;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeAlbumDTO_0 extends _i1.SmartFake implements _i2.AlbumDTO {
  _FakeAlbumDTO_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAlbum_1 extends _i1.SmartFake implements _i3.Album {
  _FakeAlbum_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AlbumFindByIdProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockAlbumFindByIdProvider extends _i1.Mock
    implements _i4.AlbumFindByIdProvider {
  MockAlbumFindByIdProvider(MockAlbumServiceImpl albumServiceImpl);

  @override
  set onError(_i5.ErrorListener? _onError) => super.noSuchMethod(
        Invocation.setter(
          #onError,
          _onError,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get mounted => (super.noSuchMethod(
        Invocation.getter(#mounted),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  _i6.Stream<_i2.AlbumDTO> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i6.Stream<_i2.AlbumDTO>.empty(),
        returnValueForMissingStub: _i6.Stream<_i2.AlbumDTO>.empty(),
      ) as _i6.Stream<_i2.AlbumDTO>);

  @override
  _i2.AlbumDTO get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeAlbumDTO_0(
          this,
          Invocation.getter(#state),
        ),
        returnValueForMissingStub: _FakeAlbumDTO_0(
          this,
          Invocation.getter(#state),
        ),
      ) as _i2.AlbumDTO);

  @override
  set state(_i2.AlbumDTO? value) => super.noSuchMethod(
        Invocation.setter(
          #state,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i2.AlbumDTO get debugState => (super.noSuchMethod(
        Invocation.getter(#debugState),
        returnValue: _FakeAlbumDTO_0(
          this,
          Invocation.getter(#debugState),
        ),
        returnValueForMissingStub: _FakeAlbumDTO_0(
          this,
          Invocation.getter(#debugState),
        ),
      ) as _i2.AlbumDTO);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  dynamic findById({required int? id}) => super.noSuchMethod(
        Invocation.method(
          #findById,
          [],
          {#id: id},
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool updateShouldNotify(
    _i2.AlbumDTO? old,
    _i2.AlbumDTO? current,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateShouldNotify,
          [
            old,
            current,
          ],
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  _i5.RemoveListener addListener(
    _i7.Listener<_i2.AlbumDTO>? listener, {
    bool? fireImmediately = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
          {#fireImmediately: fireImmediately},
        ),
        returnValue: () {},
        returnValueForMissingStub: () {},
      ) as _i5.RemoveListener);

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [AlbumServiceImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockAlbumServiceImpl extends _i1.Mock implements _i8.AlbumServiceImpl {
  @override
  _i6.Future<_i3.Album> fetchAlbum(int? id) => (super.noSuchMethod(
        Invocation.method(
          #fetchAlbum,
          [id],
        ),
        returnValue: _i6.Future<_i3.Album>.value(_FakeAlbum_1(
          this,
          Invocation.method(
            #fetchAlbum,
            [id],
          ),
        )),
        returnValueForMissingStub: _i6.Future<_i3.Album>.value(_FakeAlbum_1(
          this,
          Invocation.method(
            #fetchAlbum,
            [id],
          ),
        )),
      ) as _i6.Future<_i3.Album>);

  @override
  _i6.Future<List<_i3.Album>> fetchListAlbum() => (super.noSuchMethod(
        Invocation.method(
          #fetchListAlbum,
          [],
        ),
        returnValue: _i6.Future<List<_i3.Album>>.value(<_i3.Album>[]),
        returnValueForMissingStub:
            _i6.Future<List<_i3.Album>>.value(<_i3.Album>[]),
      ) as _i6.Future<List<_i3.Album>>);
}
