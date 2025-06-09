import Foundation

// MARK: - Clinics

extension DBRResources {
    public struct ClinicsResource {
        let url: URL
        let path: String

        public var get: DBRRequest<DBRDataResponse<[DBRClinicDTO]>> {
            var headers = [String: String]()

            if let lang = Bundle.main.preferredLocalizations.first {
                headers["Accept-Language"] = lang
            }

            return DBRRequest(url: url, path: path, query: nil, headers: headers)
        }
    }

    public static func clinics() -> ClinicsResource {
        ClinicsResource(url: DBREndpoint.baseURL, path: DBREndpoint.ClinicInfo.clinics)
    }
}

// MARK: - Professions

extension DBRResources {
    public struct ProfessionsResource {
        let url: URL
        let path: String

        public var get: DBRRequest<DBRDataResponse<[DBRProfessionDTO]>> {
            DBRRequest(url: url, path: path, query: nil)
        }
    }

    public static func professions() -> ProfessionsResource {
        ProfessionsResource(url: DBREndpoint.baseURL, path: DBREndpoint.ClinicInfo.professions)
    }
}

// MARK: - ServiceCategories

extension DBRResources {
    public struct ServiceCategoriesResource {
        let url: URL
        let path: String

        public var get: DBRRequest<DBRDataResponse<[DBRServiceCategoryDTO]>> {
            var headers = [String: String]()

            if let lang = Bundle.main.preferredLocalizations.first {
                headers["Accept-Language"] = lang
            }

            return DBRRequest(url: url, path: path, query: nil, headers: headers)
        }
    }

    public static func serviceCategories() -> ServiceCategoriesResource {
        ServiceCategoriesResource(url: DBREndpoint.baseURL, path: DBREndpoint.ClinicInfo.serviceCategories)
    }
}

// MARK: - Services

extension DBRResources {
    public struct ServicesResource {
        let url: URL
        let path: String
        let serviceIds: [Int]?
        let professionId: Int?
        let categoryIds: [Int]?

        public var get: DBRRequest<DBRDataResponse<[DBRServiceDTO]>> {
            var query: [(String, String?)] = []

            if let professionId {
                query.append(("profession_id", String(professionId)))
            }

            if let categoryIds, !categoryIds.isEmpty {
                let value = categoryIds.map(String.init).joined(separator: ",")
                query.append(("category_id", value))
            }

            if let serviceIds, !serviceIds.isEmpty {
                let value = serviceIds.map(String.init).joined(separator: ",")
                query.append(("service_id", value))
            }

            return DBRRequest(url: url, path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func services(
        serviceIds: [Int]? = nil,
        professionId: Int? = nil,
        categoryIds: [Int]? = nil
    ) -> ServicesResource {
        ServicesResource(
            url: DBREndpoint.baseURL,
            path: DBREndpoint.ClinicInfo.services,
            serviceIds: serviceIds,
            professionId: professionId,
            categoryIds: categoryIds
        )
    }
}
