// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Raw data for the animation demo.

import 'package:flutter/material.dart';

const Color _fullBlue = Color.fromRGBO(27, 59, 106, 5);
const Color _partBlue = Color.fromRGBO(35, 96, 142, 5);
const Color _partGreen = Color.fromRGBO(90, 177, 159, 5);
const Color _fullGreen = Color.fromRGBO(90, 177, 106, 5);
const Color _finalBlue = Color.fromRGBO(9, 43, 93, 5);

const String _kGalleryAssetsPackage = 'flutter_gallery_assets';

class SectionDetail {
  const SectionDetail({
    this.buttonText,
    this.buttonRoute,
    this.passedData,
    this.imageAsset,
    this.imageAssetPackage,
  });

  final String buttonText;
  final String buttonRoute;
  final String passedData;
  final String imageAsset;
  final String imageAssetPackage;
}

class Section {
  const Section({
    this.title,
    this.backgroundAsset,
    this.backgroundAssetPackage,
    this.leftColor,
    this.rightColor,
    this.details,
  });

  final String title;
  final String backgroundAsset;
  final String backgroundAssetPackage;
  final Color leftColor;
  final Color rightColor;
  final List<SectionDetail> details;

  @override
  bool operator ==(Object other) {
    if (other is! Section) return false;
    final Section otherSection = other;
    return title == otherSection.title;
  }

  @override
  int get hashCode => title.hashCode;
}

// TODO(hansmuller): replace the SectionDetail images and text. Get rid of
// the const vars like _eyeglassesDetail and insert a variety of titles and
// image SectionDetails in the allSections list.

const SectionDetail _AvazziaCompanyOverview = SectionDetail(
  imageAsset: 'products/sunnies.png',
  imageAssetPackage: _kGalleryAssetsPackage,
  buttonText: 'Company Overview',
  buttonRoute:
      'pdfform',
  passedData: 'pdfs/companyOverview.pdf',
);

const SectionDetail _AvazziaCommonProtocols = SectionDetail(
  imageAsset: 'products/sunnies.png',
  imageAssetPackage: _kGalleryAssetsPackage,
  buttonText: 'Common Protocols',
  buttonRoute: '',
  passedData: 'AvazziaSecondLevel',
);

const SectionDetail _AvazziaTrainingVideos = SectionDetail(
  imageAsset: 'products/sunnies.png',
  imageAssetPackage: _kGalleryAssetsPackage,
  buttonText: 'Training Videos',
  buttonRoute: '',
  passedData: 'Training Videos',
);

const SectionDetail _AvazziaPresentations = SectionDetail(
  imageAsset: 'products/sunnies.png',
  imageAssetPackage: _kGalleryAssetsPackage,
  buttonText: 'Presentations',
  buttonRoute: '',
  passedData: 'Presentations',
);

const SectionDetail _AvazziaStudies = SectionDetail(
  imageAsset: 'products/sunnies.png',
  imageAssetPackage: _kGalleryAssetsPackage,
  buttonText: 'Studies and White Papers',
  buttonRoute:
      'https://drive.google.com/drive/folders/0B8rr2eX67a6PcDdnZGd1WkptU2s',
  passedData: '',
);

//const SectionDetail _eyeglassesImageDetail = SectionDetail(
//  imageAsset: 'products/sunnies.png',
//  imageAssetPackage: _kGalleryAssetsPackage,
//);

const SectionDetail _QRSProductOverview = SectionDetail(
  imageAsset: 'products/table.png',
  imageAssetPackage: _kGalleryAssetsPackage,
  buttonText: 'Product Overview',
  buttonRoute:
      'pdfform',
  passedData: 'pdfs/QRSproductOverview.pdf',
);

const SectionDetail _QRSSetUp = SectionDetail(
  imageAsset: 'products/table.png',
  imageAssetPackage: _kGalleryAssetsPackage,
  buttonText: 'Setup Instructions',
  buttonRoute: 'https://www.youtube.com/watch?v=b6MEr-0YNIo',
  passedData: '',
);

const SectionDetail _QRSGermanToEnglish = SectionDetail(
  imageAsset: 'products/table.png',
  imageAssetPackage: _kGalleryAssetsPackage,
  buttonText: 'German to English',
  buttonRoute: '',
  passedData: 'German to English',
);

const SectionDetail _QRSCommonProtocols = SectionDetail(
  imageAsset: 'products/table.png',
  imageAssetPackage: _kGalleryAssetsPackage,
  buttonText: 'Common Protocols',
  buttonRoute: '',
  passedData: 'QRSlist',
);

const SectionDetail _QRSClinicallyResearchedProtocols = SectionDetail(
  imageAsset: 'products/table.png',
  imageAssetPackage: _kGalleryAssetsPackage,
  buttonText: 'Clinically Researched Protocols',
  buttonRoute:
      'pdfform',
  passedData: 'pdfs/clinicallyProtocols.pdf',
);

const SectionDetail _QRSStudies = SectionDetail(
  imageAsset: 'products/table.png',
  imageAssetPackage: _kGalleryAssetsPackage,
  buttonText: 'Studies and White Papers',
  buttonRoute:
      'https://drive.google.com/drive/folders/0B8rr2eX67a6PUVkxZUpZcXk2SGs',
  passedData: '',
);

const SectionDetail _QRSWhitePaper = SectionDetail(
  imageAsset: 'products/table.png',
  imageAssetPackage: _kGalleryAssetsPackage,
  buttonText: 'White Paper PEMF',
  buttonRoute:
      'pdfform',
  passedData: 'pdfs/whitePaperPemf.pdf',
);

const SectionDetail _QRSDrOzVideo = SectionDetail(
  imageAsset: 'products/table.png',
  imageAssetPackage: _kGalleryAssetsPackage,
  buttonText: 'Dr. Oz Video',
  buttonRoute: 'https://www.facebook.com/watch/?v=294796531317135',
  passedData: '',
);

const SectionDetail _GutCheckTestInstructions = SectionDetail(
  imageAsset: 'products/earrings.png',
  imageAssetPackage: _kGalleryAssetsPackage,
  buttonText: 'Test Instructions',
  buttonRoute: '',
  passedData: 'Test Instructions',
);

const SectionDetail _GutCheckSampleReport = SectionDetail(
  imageAsset: 'products/earrings.png',
  imageAssetPackage: _kGalleryAssetsPackage,
  buttonText: 'Sample Report',
  buttonRoute:
      'pdfform',
  passedData: 'pdfs/sampleReport.pdf',
);

const SectionDetail _GutCheckRecommendationReport = SectionDetail(
  imageAsset: 'products/earrings.png',
  imageAssetPackage: _kGalleryAssetsPackage,
  buttonText: 'Recommendation Report',
  buttonRoute:
      'pdfform',
  passedData: 'pdfs/recommendationReport.pdf',
);

const SectionDetail _GutCheckStudies = SectionDetail(
  imageAsset: 'products/earrings.png',
  imageAssetPackage: _kGalleryAssetsPackage,
  buttonText: 'Studies',
  buttonRoute:
      'https://drive.google.com/drive/folders/0B8rr2eX67a6PVUx4Y0tISnU1UjQ',
  passedData: '',
);

const SectionDetail _AppsSitesMDLive = SectionDetail(
  imageAsset: 'products/hat.png',
  imageAssetPackage: _kGalleryAssetsPackage,
  buttonText: 'Download MD Live',
  buttonRoute: '',
  passedData: 'MDLive',
);

const SectionDetail _AppsSitesFASite = SectionDetail(
  imageAsset: 'products/hat.png',
  imageAssetPackage: _kGalleryAssetsPackage,
  buttonText: 'Our Website',
  buttonRoute: 'https://www.firstalternativetherapies.com',
  passedData: '',
);

const SectionDetail _AppsSitesFACHealth = SectionDetail(
  imageAsset: 'products/hat.png',
  imageAssetPackage: _kGalleryAssetsPackage,
  buttonText: 'FAC Health',
  buttonRoute: 'https://www.fachealth.com',
  passedData: '',
);

final List<Section> allSections = <Section>[
  const Section(
    title: 'AVAZZIA',
    leftColor: _fullGreen,
    rightColor: _partGreen,
    backgroundAsset: 'images/AvazziaBackground.png',
    //backgroundAssetPackage: _kGalleryAssetsPackage,
    details: <SectionDetail>[
      _AvazziaCompanyOverview,
      _AvazziaCommonProtocols,
      _AvazziaTrainingVideos,
      _AvazziaPresentations,
      _AvazziaStudies
    ],
  ),
  const Section(
    title: 'QRS',
    leftColor: _partGreen,
    rightColor: _partBlue,
    backgroundAsset: 'images/QRSBackground.png',
    //backgroundAssetPackage: _kGalleryAssetsPackage,
    details: <SectionDetail>[
      _QRSProductOverview,
      _QRSSetUp,
      _QRSGermanToEnglish,
      _QRSCommonProtocols,
      _QRSClinicallyResearchedProtocols,
      _QRSStudies,
      _QRSWhitePaper,
      _QRSDrOzVideo
    ],
  ),
  const Section(
    title: 'GUT CHECK',
    leftColor: _partBlue,
    rightColor: _fullBlue,
    backgroundAsset: 'images/GutCheckBackground.png',
    //backgroundAssetPackage: _kGalleryAssetsPackage,
    details: <SectionDetail>[
      _GutCheckTestInstructions,
      _GutCheckSampleReport,
      _GutCheckRecommendationReport,
      _GutCheckStudies
    ],
  ),
  const Section(
    title: 'APPS & SITES',
    leftColor: _fullBlue,
    rightColor: _finalBlue,
    backgroundAsset: 'images/FAlogoBackground.png',
    //backgroundAssetPackage: _kGalleryAssetsPackage,
    details: <SectionDetail>[
      _AppsSitesMDLive,
      _AppsSitesFASite,
      _AppsSitesFACHealth
    ],
  ),
];
