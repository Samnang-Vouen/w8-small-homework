import 'package:asynchronous_future_asyncvalue/data/repositories/songs/song_repository_mock.dart';

void main() async {
  //   Instantiate the  song_repository_mock
  SongRepositoryMock repo = SongRepositoryMock();
  // Test both the success and the failure of the post request

  // Handle the Future using 2 ways  (2 tests)
  // - Using then() with .catchError().
  // success call
  repo
      .fetchSongs()
      .then((songs) {
        print('First fetch success: ${songs.map((s) => s.title).toList()}');
      })
      .catchError((error) {
        print('First fetch error: $error');
      });
  // fail call
  repo
      .fetchSongs()
      .then((songs) {
        print('Second fetch success: ${songs.map((s) => s.title).toList()}');
      })
      .catchError((error) {
        print('Second fetch error: $error');
      });
  // - Using async/await with try/catch.
  // success call
  try {
    final songs = await repo.fetchSongs();
    print('Third fetch success: ${songs.map((s) => s.title).toList()}');
  } catch (error) {
    print('Third fetch error: $error');
  }
  // fail call
  try {
    final songs = await repo.fetchSongs();
    print('Fourth fetch success: ${songs.map((s) => s.title).toList()}');
  } catch (error) {
    print('Fourth fetch error: $error');
  }

  //fail call with wrong ID
  repo
      .fetchSongById('s25')
      .then((song) {
        print('Fetch success with id s25: ${song?.title}');
      })
      .catchError((error) {
        print('Fetch error with id s25: $error');
      });

  try {
    final song = await repo.fetchSongById('s25');
    print('Fetch success with id s25: ${song?.title}');
  } catch (error) {
    print('Fetch error with id s25: $error');
  }
}
