
REGLAS_VALIDACION = {
    "numero_identificacion_estudiante": {
        "type": "string",
        "description": "Número de identificación extraído del documento.",
        "required": True,
        "required_by": [
            "identification",
            "estampilla_pro_cultura",
            "saber_pro"
        ],
        "rules": [
            "identification_number_present",
            "identification_number_numeric",
            "identification_number_length",
            "identification_number_consistency"
        ]
    },

    "nombre_estudiante": {
        "type": "string",
        "description": "Nombre completo del estudiante.",
        "required": True,
        "required_by": [
            "identification",
            "academic_evaluation",
            "paz_y_salvo_bib",
            "estampilla_pro_cultura",
            "saber_pro"
        ],
        "rules": [
            "student_name_present",
            "student_name_format",
            "student_name_consistency"
        ]
    },

    "codigo_estudiante": {
        "type": "string",
        "description": "Código institucional del estudiante.",
        "required": False,
        "required_by": [
            "academic_evaluation",
            "paz_y_salvo_bib"
        ],
        "validation": {
            "pattern": r"^T000\d{5}$",
            "case_sensitive": False
        },
        "rules": [
            "student_code_format",
            "student_code_consistency"
        ]
    },

    "tipo_documento": {
        "type": "string",
        "description": "Tipo documental identificado mediante OCR y clasificación.",
        "required": True,
        "required_by": [
            "identification",
            "academic_evaluation",
            "paz_y_salvo_bib",
            "estampilla_pro_cultura",
            "saber_pro"
        ],
        "rules": [
            "document_type_match",
            "document_content_match"
        ]
    },

    "legibilidad_documento": {
        "type": "boolean",
        "description": "Indica si el archivo permite extraer información suficiente.",
        "required": True,
        "rules": [
            "file_readable",
            "image_quality_acceptable",
            "required_pages_present",
            "ocr_text_sufficient"
        ]
    },

    "nivel_confianza_ocr": {
        "type": "float",
        "description": "Confianza de la extracción de texto realizada por el OCR.",
        "required": True,
        "required_by": [
            "identification",
            "academic_evaluation",
            "paz_y_salvo_bib",
            "estampilla_pro_cultura",
            "saber_pro"
        ],
        "result": None,
        "pass_with_threshold": 0.80,
        "pass": None,
        "on_low_confidence": "to_check"
    },

    "nivel_confianza_identificacion": {
        "type": "float",
        "description": (
            "Puntuación de similitud entre la identidad extraída "
            "y los datos registrados en la solicitud. No demuestra "
            "por sí sola la autenticidad del documento."
        ),
        "required": True,
        "required_by": [
            "identification",
            "academic_evaluation",
            "paz_y_salvo_bib",
            "estampilla_pro_cultura",
            "saber_pro"
        ],
        "result": None,
        "pass_with_threshold": 0.80,
        "pass": None,
        "on_ambiguous_match": "to_check"
    },

    "consistencia_informacion_estudiante": {
        "type": "boolean",
        "description": (
            "Indica si los datos extraídos coinciden con la "
            "información registrada en la solicitud de grado."
        ),
        "required": True,
        "required_by": [
            "identification",
            "academic_evaluation",
            "paz_y_salvo_bib",
            "estampilla_pro_cultura",
            "saber_pro"
        ],
        "rules": [
            "student_identity_match",
            "student_code_match_when_available",
            "cross_document_identity_match"
        ]
    },

    "integridad_documento": {
        "type": "string",
        "description": (
            "Resultado de las comprobaciones técnicas de "
            "integridad del archivo y de su contenido."
        ),
        "required": True,
        "allowed_values": [
            "acceptable",
            "warning",
            "insufficient_information"
        ],
        "rules": [
            "file_opens_successfully",
            "expected_pages_present",
            "duplicate_page_detection",
            "suspicious_content_detection"
        ]
    },

    "documento_duplicado": {
        "type": "boolean",
        "description": (
            "Indica si el documento ya fue cargado en la misma "
            "solicitud o si existe una posible duplicidad."
        ),
        "required": True,
        "rules": [
            "duplicate_file_detection",
            "duplicate_document_detection"
        ]
    },

    "revision_manual_requerida": {
        "type": "boolean",
        "description": (
            "Indica si alguna regla necesita confirmación "
            "de un funcionario de grados."
        ),
        "required": True
    },

    "version_reglas": {
        "type": "string",
        "description": "Versión del conjunto de reglas utilizado.",
        "required": True
    }
}
