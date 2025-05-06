import Foundation

// MARK: - Clinics

extension Resources {
    public struct ClinicsResource {
        let path: String

        public var get: Request<DataResponse<[ClinicDTO]>> {
            Request(path: path, query: nil)
        }
    }

    public static func clinics() -> ClinicsResource {
        ClinicsResource(path: Endpoint.clinics)
    }
}

// MARK: - Professions

extension Resources {
    public struct ProfessionsResource {
        let path: String

        public var get: Request<DataResponse<[ProfessionDTO]>> {
            Request(path: path, query: nil)
        }
    }

    public static func professions() -> ProfessionsResource {
        ProfessionsResource(path: Endpoint.professions)
    }
}

// MARK: - ServiceCategories

extension Resources {
    public struct ServiceCategoriesResource {
        let path: String

        public var get: Request<DataResponse<[ServiceCategoryDTO]>> {
            Request(path: path, query: nil)
        }
    }

    public static func serviceCategories() -> ServiceCategoriesResource {
        ServiceCategoriesResource(path: Endpoint.serviceCategories)
    }
}

// MARK: - Services

extension Resources {
    public struct ServicesResource {
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

            return Request(path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func services(
        serviceIds: [Int]? = nil,
        professionId: Int? = nil,
        categoryIds: [Int]? = nil
    ) -> ServicesResource {
        ServicesResource(
            path: Endpoint.services,
            serviceIds: serviceIds,
            professionId: professionId,
            categoryIds: categoryIds
        )
    }
}
