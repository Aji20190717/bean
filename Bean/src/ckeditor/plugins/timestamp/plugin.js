/*
 저작권 (c) 2014-2020, CKSource-Frederico Knabben. 판권 소유.
  MIT 라이센스 조건에 따라 라이센스가 부여되었습니다 (LICENSE.md 참조).
 
  현재 날짜와 시간을 CKEditor 편집 영역에 삽입하는 기본 샘플 플러그인.
 
  CKEditor 플러그인 SDK에서 생성 :
  https://ckeditor.com/docs/ckeditor4/latest/guide/plugin_sdk_intro.html


*/

// 편집기 내에서 플러그인을 등록합니다.
CKEDITOR.plugins.add( 'timestamp', {

	// 아이콘을 등록합니다. 명령 이름과 일치해야합니다.
	icons: 'timestamp',

	// 플러그인 초기화 로직은이 메소드 내부에 있습니다.
	init: function( editor ) {

		// 타임 스탬프를 삽입하는 편집기 명령을 정의합니다.
		editor.addCommand( 'insertTimestamp', {

			// 명령이 실행될 때 실행될 함수를 정의합니다.
			exec : function (  editor  )  {
				var  now  =  new  Date ( ) ;

				// 문서에 타임 스탬프를 삽입합니다.
				editor.insertHtml( 'The current date and time is: <em>' + now.toString() + '</em>' );
			}
		}) ;

		// 위의 명령을 실행하는 툴바 버튼을 생성합니다.
		editor.ui.addButton( 'Timestamp', {
			label: 'Insert Timestamp',
			command: 'insertTimestamp',
			toolbar: 'insert,0'
		} ) ;
	}
} ) ;