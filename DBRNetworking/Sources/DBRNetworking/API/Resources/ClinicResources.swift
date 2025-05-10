import Foundation

// MARK: - Clinics

extension Resources {
    public struct ClinicsResource {
        let url: URL
        let path: String

        public var get: Request<DataResponse<[ClinicDTO]>> {
            Request(url: url, path: path, query: nil)
        }
    }

    public static func clinics() -> ClinicsResource {
        ClinicsResource(url: Endpoint.baseURL, path: Endpoint.ClinicInfo.clinics)
    }
}

// MARK: - Professions

extension Resources {
    public struct ProfessionsResource {
        let url: URL
        let path: String

        public var get: Request<DataResponse<[ProfessionDTO]>> {
            Request(url: url, path: path, query: nil)
        }
    }

    public static func professions() -> ProfessionsResource {
        ProfessionsResource(url: Endpoint.baseURL, path: Endpoint.ClinicInfo.professions)
    }
}

// MARK: - ServiceCategories

extension Resources {
    public struct ServiceCategoriesResource {
        let url: URL
        let path: String

        public var get: Request<DataResponse<[ServiceCategoryDTO]>> {
            Request(url: url, path: path, query: nil)
        }
    }

    public static func serviceCategories() -> ServiceCategoriesResource {
        ServiceCategoriesResource(url: Endpoint.baseURL, path: Endpoint.ClinicInfo.serviceCategories)
    }
}

// MARK: - Services

extension Resources {
    public struct ServicesResource {
        let url: URL
        let path: String
        let serviceIds: [Int]?
        let professionId: Int?
        let categoryIds: [Int]?

        public var get: Request<DataResponse<[ServiceDTO]>> {
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

            return Request(url: url, path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func services(
        serviceIds: [Int]? = nil,
        professionId: Int? = nil,
        categoryIds: [Int]? = nil
    ) -> ServicesResource {
        ServicesResource(
            url: Endpoint.baseURL,
            path: Endpoint.ClinicInfo.services,
            serviceIds: serviceIds,
            professionId: professionId,
            categoryIds: categoryIds
        )
    }
}
