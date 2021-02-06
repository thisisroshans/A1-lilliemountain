import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skimscope/model/facilities_model.dart';

class ServicesModel {
  final String id;
  final String equipmentId;
  final String title;
  final DateTime startDate;
  final DateTime endDate;
  final FacilitesModel facility;
  final String notes;
  final String createdBy;
  final Timestamp whenCreated;
  final Timestamp whenModified;

  ServicesModel({
    this.id,
    this.equipmentId,
    this.title,
    this.startDate,
    this.endDate,
    this.facility,
    this.notes,
    this.createdBy,
    this.whenCreated,
    this.whenModified,
  });

  factory ServicesModel.fromFirestore(DocumentSnapshot doc) {
    var id = doc.id;
    var data = doc.data();

    return ServicesModel(
      id: id,
      equipmentId: data['equipmentId'],
      title: data['title'],
      startDate: data['startDate'],
      endDate: data['endDate'],
      facility: FacilitesModel.fromJSON(data['facility']),
      createdBy: data['createdBy'],
      notes: data['notes'],
      whenCreated: data['whenCreated'],
      whenModified: data['whenModified'] ?? null,
    );
  }
}
