import Foundation
import DBRCore

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
        let serviceId: [Int]?
        let professionId: Int?
        let categoryId: [Int]?

        public var get: Request<DataResponse<[ServiceDTO]>> {
            var query: [(String, String?)] = []

            if let professionId {
                query.append(("profession_id", String(professionId)))
            }

            if let categoryId, !categoryId.isEmpty {
                let value = categoryId.map(String.init).joined(separator: ",")
                query.append(("category_id", value))
            }

            if let serviceId, !serviceId.isEmpty {
                let value = serviceId.map(String.init).joined(separator: ",")
                query.append(("service_id", value))
            }

            return Request(path: path, query: query.isEmpty ? nil : query)
        }
    }

    public static func services(serviceId: [Int]? = nil, professionId: Int? = nil, categoryId: [Int]? = nil) -> ServicesResource {
        ServicesResource(path: Endpoint.services, serviceId: serviceId, professionId: professionId, categoryId: categoryId)
    }
}
