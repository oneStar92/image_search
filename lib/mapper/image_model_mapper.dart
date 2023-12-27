import 'package:image_search/Model/image_model.dart';
import 'package:image_search/dto/image_dto.dart';

extension ImagesDtoToModel on ImagesDTO {
  List<ImageModel> toModels() {
    return hits
            ?.map((e) => ImageModel(
                imageUrl: e.previewURL ??
                    'https://mblogthumb-phinf.pstatic.net/MjAyMDAyMTNfMTc1/MDAxNTgxNTYxNTcyMTA0.0ZI3U3gDPpeIZwrLk_hBKaj4AX2toVC7qWttISky_I4g.S3dtcNwSLhN2iakYm3hhfubQTRhD4NRiVOREpSi41MQg.PNG.lccthebox4/image.png?type=w800'))
            .toList() ??
        [];
  }
}
