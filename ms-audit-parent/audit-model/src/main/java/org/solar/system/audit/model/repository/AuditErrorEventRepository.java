package org.solar.system.audit.model.repository;

import org.solar.system.audit.model.entities.AuditErrorEvent;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface AuditErrorEventRepository extends JpaRepository<AuditErrorEvent, UUID> {
}
