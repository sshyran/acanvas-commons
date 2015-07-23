import 'dart:html' as html;
import 'package:stagexl_commons/stagexl_commons.dart';
import 'package:stagexl/stagexl.dart';

Stage stage;
Sprite _container;


void main() {
  var opts = new StageOptions();
  opts.renderEngine = RenderEngine.Canvas2D;
  opts.backgroundColor = 0xFFf9f9f9;
  opts.stageScaleMode = StageScaleMode.NO_SCALE;
  opts.stageAlign = StageAlign.TOP_LEFT;

  stage = new Stage(html.querySelector('#stage'), options: opts);
  ContextTool.STAGE = stage;
  ContextTool.WEBGL = stage.renderEngine == RenderEngine.WebGL ? true : false;
  new RenderLoop()..addStage(stage);

  FontTool.addFont("Roboto");
  FontTool.loadFonts(start);
}
void start() {


  Flow vbox = new Flow()
    ..flowOrientation = FlowOrientation.VERTICAL
    ..spacing = 40
    ..x = 10
    ..y = 10
    ..autoRefresh = false;

  /*
   * Standard Input Field with Label
   */
  PaperInput input1 = new PaperInput("Type something");
  vbox.addChild(input1);

  /*
   * Standard Input Field with Floating Label
   */
  PaperInput input2 = new PaperInput("Type something (floating)", floating : true);
  vbox.addChild(input2);

  /*
   * Mandatory Input Field
   */
  PaperInput input3 = new PaperInput("Type something", required : "This input requires a value.");
  vbox.addChild(input3);

  /*
   * Mandatory Input Field with Floating Label
   */
  PaperInput input4 = new PaperInput("Type something (floating)", required : "This input requires a value.", floating : true);
  vbox.addChild(input4);


  stage.addChild(vbox);
  vbox.span(stage.stageWidth - 20, stage.stageHeight - 20, refresh: true);


}
