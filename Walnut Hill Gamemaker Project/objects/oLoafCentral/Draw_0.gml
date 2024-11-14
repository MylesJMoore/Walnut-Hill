var _videoData = video_draw();
var _videoStatus = _videoData[0];
if(_videoStatus == 0) {
	//Draw surface that captured current video frame
	draw_surface(_videoData[1], -300, 0);
	draw_surface_ext(_videoData[1], -50, 0, .2, .2, 0, c_white, 1);
} else {
	room_goto_next();
}